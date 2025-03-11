Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0339C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 11:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fw+Gn7lVTmFQHX2G3+L709XHoTRr/Pnl+NP5DaQZweU=; b=eMF7oFuKAR/TVBsjEVCanzz5od
	Gwt3Iydlj0Sl5SyZka8k4I3IrM4ya2eNKdr8cpO2kTStzrkJWTxzlI2GF5bJt2fu8lMiWnXuP4Y6z
	AEeQBlFSaQjXYFiXuOseKYGwHt5uKVQ1IZpQ0qkURF0hvg7wpFuJO4EOAAp526yb0xA0t5b/MUIVW
	Dkush4u+V8SjmmSBDsinDuZoG5hHIytXb4YuMdkYGLZSBVJM4Em/ouOMbGqYVwZlgBkzaZAipYgfh
	PlaaekbF3JwmBWAjUs7J3jNS5QJNL3lT+Q09DNs3aEE++q0ZKCLIRFSROHh+HZUHGjFaBXwMwdTfN
	ey+Xc0kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trxnI-00000005TCB-37Do;
	Tue, 11 Mar 2025 11:29:08 +0000
Received: from smtp1.ms.mff.cuni.cz ([2001:718:1e03:801::4])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trxkx-00000005StK-1TW3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 11:26:45 +0000
X-SubmittedBy: id balejk@matfyz.cz subject /postalCode=110+2000/O=Univerzita+20Karlova/street=Ovocn+5CxC3+5CxBD+20trh+20560/5/ST=Praha,+20Hlavn+5CxC3+5CxAD+20m+5CxC4+5Cx9Bsto/C=CZ/CN=Karel+20Balej/emailAddress=balejk@matfyz.cz
	serial F5FD910E8FE2121B897F7E55B84E351D
	issued by /C=NL/O=GEANT+20Vereniging/CN=GEANT+20Personal+20CA+204
	auth type TLS.CUNI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mff.cuni.cz;
	s=submission; t=1741692355; x=1742992355;
	bh=fw+Gn7lVTmFQHX2G3+L709XHoTRr/Pnl+NP5DaQZweU=; h=From;
	b=kq/UFAtIqSMucu4HI3iZlAgtVwVhOzpMtt3eb7CHhn/imNiexj3QCUul1NKSNqu1U
	 FU873nUOeHpOMiioeU4wvDD97JtGMD2nZbD3KfBHFnCgUofTx3391f5KJOCElu8bLE
	 dJzi/4uoXuzh2oGTxM7Nv35t0wBJ71hFCbzry/3uA5H+pf9wpz028QYqymYrGlnFld
	 UjDfmurqYFolZvHmGm5XFA7epvrzSLM/2x0XH9u+cYehQp91HaWaVLRY6VgszmiVH1
	 ob+8uIBArw5xIdBC7vAZD8cp4mPkF3aQ82SQYjtH6YykaA3YnYURQYfo6nDcfs/GLo
	 2HJ1J0ZW8G2nQ==
Received: from localhost (c-85-230-82-121.bbcust.telenor.se [85.230.82.121])
	(authenticated)
	by smtp1.ms.mff.cuni.cz (8.16.1/8.16.1) with ESMTPS id 52BBPpFx004169
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Tue, 11 Mar 2025 12:25:53 +0100 (CET)
	(envelope-from balejk@matfyz.cz)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Mar 2025 12:25:56 +0100
Message-Id: <D8DEEUPB16WF.154Y3AEPXT4L1@matfyz.cz>
Cc: <phone-devel@vger.kernel.org>, <~postmarketos/upstreaming@lists.sr.ht>,
        =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
        <stable@vger.kernel.org>, "linux-mmc" <linux-mmc@vger.kernel.org>,
        "LKML"
 <linux-kernel@vger.kernel.org>,
        "Daniel Mack" <daniel@zonque.org>,
        "Haojian
 Zhuang" <haojian.zhuang@gmail.com>,
        "Robert Jarzmik"
 <robert.jarzmik@free.fr>,
        "Jisheng Zhang" <jszhang@kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [RFC PATCH] mmc: sdhci-pxav3: set NEED_RSP_BUSY capability
To: "Adrian Hunter" <adrian.hunter@intel.com>,
        "Ulf Hansson"
 <ulf.hansson@linaro.org>
From: "Karel Balej" <balejk@matfyz.cz>
References: <20250310140707.23459-1-balejk@matfyz.cz>
 <727c857f-0234-417b-af5d-69b3ae064d0f@intel.com>
In-Reply-To: <727c857f-0234-417b-af5d-69b3ae064d0f@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_042643_975869_866F7F85 
X-CRM114-Status: UNSURE (   7.76  )
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

Adrian Hunter, 2025-03-11T09:34:28+02:00:
> On 10/03/25 16:07, Karel Balej wrote:
>> Set the MMC_CAP_NEED_RSP_BUSY capability for the sdhci-pxav3 host to
>> prevent conversion of R1B responses to R1. Without this, the eMMC card
>> in the samsung,coreprimevelte smartphone using the Marvell PXA1908 SoC
>
> So that SoC is from 2015?

Rather at least 2014 as that's the release year of the phone.

> Is there anything more recent using this driver?

Looking at the in-tree DTs using the compatibles offered by it, it seems
that not really.

K. B.

