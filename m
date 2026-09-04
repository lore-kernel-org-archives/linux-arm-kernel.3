Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF0AC79F80
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 17:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4w+spAm0uWWwcup+mfvYNUXNY0jRbWl51yfDyG8aFs4=; b=ociaPKbC1ehOcIsB+9qvdLI2Aj
	xypmQz3Bj5Z46qsqKPt2Ey2VPkAsLIk9JjNECsHk1ugpALmW4CKQEGL/md9bg/1GyG7Wp+SAS7+Jh
	YexokdwWvIKTIqXwrJhcHmvR9D4Vc8mC1Qv4+NFGyqcwecsxkl/Oe5c+Vgr723ZuNA+8eV2wMU9Ze
	lAW4LRpGIu5+5WZx64Hoyr1Qbp+iQ17fOAy/KC0IXUkpc8Mu2ujBvcfirMnrdOmFd6w0uYyaq/obP
	mT8B6TbKK1U8G/uCfTrFyMjP/0JplYZyBBT+im1THSSHdVok5/7CuNe2pCpMa8i34UQ2nILFKRs6t
	6c1aPBOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2XqM-00000002tZB-0g2i;
	Fri, 04 Sep 2026 17:36:50 +0000
Received: from mail.alien8.de ([2a01:4f9:3051:3f93::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2XqJ-00000002tYM-0Ied
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 17:36:49 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 819D340E02C2;
	Fri,  4 Sep 2026 17:36:41 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id hQ3Yhrf6A5cH; Fri,  4 Sep 2026 17:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1788543392; bh=4w+spAm0uWWwcup+mfvYNUXNY0jRbWl51yfDyG8aFs4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SoziP6HbLj77a89rc3xWyhElxy2OnAwmmK+WrgAWWIowVnwNSlV+oP46ADmBwVsnd
	 yCEKWpz3K2lWB1VolczTE64gpfHrdUl+el0VDrMnsndNuYGmChPaqu5L7dPxINIzzL
	 iuZWueIvng7XPakfJPeYd2tpu341BU0eVn5SZ68LFkA77z2dtsGXio5ZYkw2nev0ru
	 O88KY8ucs9tL1wuesqPVECx/dX6fjGRoToFiD4G2c+KIREQpyGnPLbM45xOSveEiWB
	 +hqfmycEwh+nAegtmwmlXbH0fl+TGhVOFpCJEBL7Hp97ebjtjWm2jkymey1VarA2ow
	 i6smdbjmsWdEUQiFTqdG79gR7dIlPU3Mdq7MT+ezbk2uvqIn/sTIEFzXqATPY9DPYa
	 A8BI9unS0kprXvhhQvDdqQtmNjAVvcJHZu7kysAaHn9voLOft+hpxCZpSa4/xbGHxO
	 ap7SZ+gPS6kEVc3rHPlDaLlIf0NQMfKT8BJc/gVy7CmNZmIVTuHbGfGvoSYPSaWW6H
	 8nK5X0IEYhHpMIw7Vy6ac0333i/LIuDFycDtPorkXY+qT9Bp7AWrgT845p8BAwGSEe
	 MSD4u2dXsebxSD2hcn79dCdxNSKCLKIl7j3asJDV7TP6vbLFgNg34+dhJuHygbiROH
	 s0rJNoKjpmdhxq2T36DCqYGk=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 4DD0440E024B;
	Fri,  4 Sep 2026 17:36:18 +0000 (UTC)
Date: Fri, 4 Sep 2026 10:36:15 -0700
From: Borislav Petkov <bp@alien8.de>
To: Reinette Chatre <reinette.chatre@intel.com>
Cc: Ben Horgan <ben.horgan@arm.com>, x86@kernel.org, james.morse@arm.com,
	fenghuay@nvidia.com, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, tglx@linutronix.de,
	mingo@redhat.com, dave.hansen@linux.intel.com, hpa@zytor.com,
	corbet@lwn.net, linux-doc@vger.kernel.org, dave.martin@arm.com
Subject: Re: [PATCH v5 0/3] x86,fs/resctrl,arm_mpam: Factor MBA parse-time
 conversion to be per-arch
Message-ID: <20260904173615.GOapsBjyiT7uXHd-Qc@fat_crate.local>
References: <20260709093111.367851-1-ben.horgan@arm.com>
 <165e7636-d7e9-4d16-aad1-657b4a9698d0@intel.com>
 <b0a7035e-7ffe-4e22-a4ae-a177640234b8@intel.com>
 <20260904033751.GCapo9D5ZZXWuQkIpc@fat_crate.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260904033751.GCapo9D5ZZXWuQkIpc@fat_crate.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_103647_781658_3901CAFF 
X-CRM114-Status: UNSURE (   7.59  )
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

On Thu, Sep 03, 2026 at 08:37:51PM -0700, Borislav Petkov wrote:
> Lemme have a look.

Sashiko has comments:

https://sashiko.dev/#/patchset/20260709093111.367851-1-ben.horgan%40arm.com

Please address them: if valid, fix them, if not, explain why they don't need
to be fixed.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

