Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F7BCA5FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 06:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VPGN+t64IBvFdkHANdn3m+qys3d57vxK5dztlkdO85Y=; b=IgYga+kMeEkLT1CqcskLlfKVRT
	IeBKzmu6kVuM3MBzsAgnBdkuNzuYYnm7twDKd/OnTUiWpdADhCM/O/EaaJbtI9RNjmLifI1Ou6DRg
	r3Qv3TUanRmqCeRzBrHm2Bw4titn6WmoYO4EXG3Kvy0237XFwZP/58KUDIbahfq58kOHKA9nDGToG
	gxFSDGSIXhHrCrELjk++o4u2bXdSbqe8fP74rnV9kPJ9/G4j9gTRaPfzjgIahXpF5hqa/VH/hjIu2
	w6lC9h1DlpkfWn11O02/d0wWP9sgTvauUfy0KZ8nSdtIEz6Ysn229Rzh7iJn0ONmP/JGjLfviPKPV
	Ph5dLtBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xELPb-00000001nSm-3x3l;
	Wed, 07 Oct 2026 06:46:00 +0000
Received: from out-159.mta1.migadu.com ([2001:41d0:203:375::9f] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xELPZ-00000001nRw-1Sza
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 06:45:58 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=VPGN+t64IBvFdkHANdn3m+qys3d57vxK5dztlkdO85Y=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791355554; v=1; x=1791960354;
 b=Rtgt7twX/Rh0o/TU6DHLRWLO1tNqSRc+sZFIcDB8L+bPAs1rGA2ZRuyp6CXbfUbdlO85bjMR
 drHMuWHnQGPUg6CRZv/3aRQAzhnbibjKU7fMz1L/xqJgdh28HuqCFnqNfIfIs8/UEj7CqoioV7N
 2EwKilTwCJyLDpFm9GM2IeMk=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id bb324bf4cd5f7ca7;
	Wed, 07 Oct 2026 03:22:45 +0000
X-Mizu-Trace-ID: bb324bf4cd5f7ca7
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5ba40832934so2843e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 20:22:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx8MmeWUwgZSKDjsR6xy4FzUKLk95WUlIoThf0sCfbxj8tZNTAvUaHKWBr3zwIiZfjw6gxFDN2vDLd+qDnG+XF8@lists.infradead.org
X-Gm-Message-State: AFq9FYJohS8VLxyAzHY+hAYafrILuF6rzldY5m7oUUggCmcV0/FmXhrB
	p6L2fO0a8XqyFwVbTIEog8rDFp25aLTzRNsUmSt/3xD0OCQ/eiq1r6HUROBo90FOt39iHfIwV0j
	EBKtAKMeinEl/VBb49ELgEZ7gW4VY9OpWf/sviMaa
X-Received: by 2002:a05:6512:33d3:b0:5bb:ff6f:b4bd with SMTP id
 2adb3069b0e04-5bcca66e395mr244039e87.14.1791343364546; Tue, 06 Oct 2026
 20:22:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260917162020.1612577-1-fuad.tabba@linux.dev>
In-Reply-To: <20260917162020.1612577-1-fuad.tabba@linux.dev>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 7 Oct 2026 05:22:07 +0200
X-Gmail-Original-Message-ID: <CA+EHjTwDaaPCN0=pGJ89bGA0N5URZAK+eqTokvkHmft4qAtCmQ@mail.gmail.com>
X-Gm-Features: AclHuK-0Udk3UkUYFCVMAQPB6nZiw27oXOAJk7rq0N4zkCuJTUndM-riXQ1es2E
Message-ID: <CA+EHjTwDaaPCN0=pGJ89bGA0N5URZAK+eqTokvkHmft4qAtCmQ@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: vgic-its: Update GITS_CTLR.Enabled under its_lock
To: Oliver Upton <oupton@kernel.org>
Cc: Hyunwoo Kim <imv4bel@gmail.com>, Eric Auger <eauger@redhat.com>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Will Deacon <will@kernel.org>, Sascha Bischoff <sascha.bischoff@arm.com>, 
	Sebastian Ene <sebastianene@google.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Marc Zyngier <maz@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_234557_568798_70B4449C 
X-CRM114-Status: UNSURE (   4.88  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Oliver,

Gentle ping on this one, the GITS_CTLR half of Hyunwoo's translation cache race.

Cheers,
/fuad

