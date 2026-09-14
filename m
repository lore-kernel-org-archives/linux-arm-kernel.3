Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A92AC88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 06:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qxRNnFkVsE0ueMn/hjtn42CI58EvndpSw9wg2y+dNKw=; b=Xj0KUhn4e8js8L0947/bYbz0dC
	eyffCdqbcNacmMOfDRTwGzxTju3+jj6Pyu/PswyE8onx7AMaa1dhmxivNLn0SHkkGFhUps6kjvDah
	woWxShnJWD6zYmZrmAOBCEso3UBmDsuLV8HpQqHTNijBJBeYWohcZPUuJQxr5D+hDjatP3ZubEvwM
	xOl3TTCFgNmaUPpOvZdb0AXwXagHZrNxTBqHPhvIC5Nk7g3xPdTTmuLGM0epbQG93QtMQqr8SB+ju
	Du1NX9RjegKx39dcmWodmlxa6WVq1vcuK9yFQ7EOBzOo7/FAGKUTInB5q/iKaAgnfzjkjIMK6AZX8
	QtSw3XJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x605x-00000002Qej-1kjr;
	Mon, 14 Sep 2026 06:23:13 +0000
Received: from out-187.mta0.migadu.com ([2001:41d0:1004:224b::bb] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x605p-00000002Qd8-2gW8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 06:23:06 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=VieHCLikamjyBABp5jihQYyq36aRCo8cSamzhnFC7ic=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789366983; v=1; x=1789971783;
 b=uG6v1qKyBVgycTalNpABGOZDZd0AeB4TmpxxHLWRi8KOWfZNNZRPZNVmaH2/vif8pGIzjspv
 9xc7Z+7ZO8Z/TY5HCzBS5Yysil8JBsSGnRk/79hmz635ny+Lrgyj/YrV6mAn4jPRj0ioj0ty7d/
 TptjiTqOV8E4taWSRTK5GGYo=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id a98ceaf837e4865c;
	Mon, 14 Sep 2026 06:23:03 +0000
X-Mizu-Trace-ID: a98ceaf837e4865c
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b4a0b384c4so5015e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 23:22:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxQkwRjvyX+JA4Ke5K+Lwx5/hwr98WbV953+M6q6cpTW+Xzz+zv0Bylp+IROerZjR3h/m2XP3M6eBckFwwGu7tu@lists.infradead.org
X-Gm-Message-State: AFuF++mS3j1VQYefYK+unqLQctb7LEoYriud62B4QSfO4lSd+fn8Stfg
	B0fb01fjFm5yLeUi5i25FI3qeZFmumbAyUspi3uf+OqbzJNPPAem+w1EuER1eGRHJ0S8uiy1E1p
	WKxNE/nsK7icB0nkikaQT5o4mWWoY6QFH6+pSA3VB
X-Received: by 2002:a05:6512:b83:b0:5b4:9dba:7401 with SMTP id
 2adb3069b0e04-5b8af7adabamr12439e87.11.1789366978483; Sun, 13 Sep 2026
 23:22:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260907070002.3333525-1-fuad.tabba@linux.dev>
 <20260907070002.3333525-11-fuad.tabba@linux.dev> <aqQA26sBLaOxt5zF@e143914.arm.com>
In-Reply-To: <aqQA26sBLaOxt5zF@e143914.arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 14 Sep 2026 07:21:00 +0100
X-Gmail-Original-Message-ID: <CA+EHjTyzoyfWVwi693=KOJnVtfm77WM7xVrK1qohggbXiK+jDA@mail.gmail.com>
X-Gm-Features: AcwNN1UHmJL4XMDsOjIzilf9wFiDj9EFVHlfMzTGCSTBDYYPUYcacTlrGdZ2ZOU
Message-ID: <CA+EHjTyzoyfWVwi693=KOJnVtfm77WM7xVrK1qohggbXiK+jDA@mail.gmail.com>
Subject: Re: [PATCH v2 10/17] KVM: arm64: Prevent host PC adjustments for
 protected vCPUs
To: Joey Gouly <joey.gouly@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Vincent Donnefort <vdonnefort@google.com>, 
	Quentin Perret <qperret@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_232305_821851_BE861A1F 
X-CRM114-Status: GOOD (  12.60  )
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

Hi Joey,

[...]

>  For a non-protected vCPU, use PKVM_HOST_STATE_DIRTY to determine
>  whether to update the host vCPU or hyp vCPU.
[...]
> Feel free to not take the rewording, but it helped me understand a bit,
> and felt clearer.

Marc had a second look at this patch and it came out reworked: the
copy selection moved into __kvm_adjust_pc() behind a get/put pair, and
the pinning moved out into its own fix. The pinning paragraph you
reworded is gone from this patch, and the PKVM_HOST_STATE_DIRTY one is
reworded along your lines.

> Not sure here why we use hyp_vcpu->vcpu.kvm over host_vcpu->kvm, in
> non-protected pKVM do we still not trust it?

It was the pointer, not the VM: EL2 wasn't dereferencing a
host-written pointer without pinning what it points at. Moot now, the
host copy is adjusted with its own struct kvm, which the fix pins.

>  /* Loaded protected vCPU: do nothing. */

The else clause went with the rework. The drop is a NULL from the get
helper, with a comment there.

> Acked-by: Joey Gouly <joey.gouly@arm.com>

Thanks! I've left it off v3 since the code you acked has changed under
you, so I'd appreciate a second look there.

Cheers,
/fuad

