Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1450ACA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 13:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e8vhESQDOgNzXpNpPec/wjonFFAgd5Bo5B7U74nvKTU=; b=35pBCAY2bTyjyK52Qt5XmevGMv
	MTRWtib5FK9fH9N19SZ9yPCOG2rNkNfX2ts+8ImliC29ruicWjwHZ85kxizF8+zCRojz3hSDCpPS2
	MyPIQKj0Kq5q7tEm28mPJy4qPhdkQcwkgZNWOQr15e6j81JCOKJCosvjm2oeV/gGKQY68Tw1hCnmp
	cQ4pHTCw9nB5ggCprRTYWMdIi+Qn54+gmWR3MaGzmTLczruVjnmG0J55XlSa/7sS/3Nk4dzMuSITl
	lyh1aJiXGv/UkrAIQBXXFYFMkqAnD77R14QMQ0Iyu0g5imoQE5gKzmKTNF8tOtjKCoR5t8cgx6uGz
	ZkxhAcMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE54y-00000000qRk-2r5u;
	Tue, 06 Oct 2026 13:19:39 +0000
Received: from out-47.mta0.migadu.com ([2001:41d0:1004:224b::2f] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE54t-00000000qQw-1uIz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 13:19:36 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=8qhe/p55ZE1Kz6sMMB02BhuqILnoV4Qe7TICQlsgGOQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791292767; v=1; x=1791897567;
 b=QBqoBFrd5TLu0ALCl2ij7XopmlYTbdRfXe2gTJOtjWtbcu2cKn36Xf8xAYrFbaaqvd7wGRl4
 ZEgsefCFFlf13XXo9A0E9QKJ0A01os8i5UnDefuhEWaFiOTkaHUduELsxN9fiEl9E7s6MrzdV1h
 MR3qQd8k6xBcsDiLjipFbteo=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 79def19f85f93070;
	Tue, 06 Oct 2026 13:19:27 +0000
X-Mizu-Trace-ID: 79def19f85f93070
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5ba429b64c5so6465e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 06:19:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx3tB0gCuJ4r2b5KRAa3Lsa+Tvcug4DeVLcu+R1uLxMXG9eTq4HJRuF1s3wrue/DloSGQfC2LAGYFYQkk5LZf+1@lists.infradead.org
X-Gm-Message-State: AFq9FYJCYP8DDGxdS3IB6UqFHhSW2od+0PPyZgdD6h/hfNQG8kK+tLvR
	adubHeb+3ovIaZXY1J05eBcOhaegLDxl1+fxQR0N+aWpq1Rrn0+Q+71JCPaGwZXpK3eD2T+vEBT
	+6s9PjKhNp+sBKjQDDIDyZQDCaXYOvM3b58kiWYxR
X-Received: by 2002:a05:6512:3f0d:b0:5ae:cf5f:4a88 with SMTP id
 2adb3069b0e04-5bcca857470mr123999e87.8.1791292766315; Tue, 06 Oct 2026
 06:19:26 -0700 (PDT)
MIME-Version: 1.0
References: <20261006092826.2201763-1-fuad.tabba@linux.dev> <asT0g8CcKoXBAmfi@kernel.org>
In-Reply-To: <asT0g8CcKoXBAmfi@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 6 Oct 2026 15:18:49 +0200
X-Gmail-Original-Message-ID: <CA+EHjTzimjyBCPZ-SDzOHWTk1xCAiC4TbA18TeMwiw2324raEA@mail.gmail.com>
X-Gm-Features: AclHuK_KzKWaq2Wxpe7q-nJwzUHg_Ej9eV3dHBV49YDQb3SMjB8JKJGtmUuaTbA
Message-ID: <CA+EHjTzimjyBCPZ-SDzOHWTk1xCAiC4TbA18TeMwiw2324raEA@mail.gmail.com>
Subject: Re: [PATCH v2] KVM: arm64: Mask SErrors in a protected vCPU's host
 copy at first run
To: Oliver Upton <oupton@kernel.org>
Cc: maz@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, joey.gouly@arm.com, 
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	vdonnefort@google.com, qperret@google.com, mark.rutland@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_061932_494503_D3F53572 
X-CRM114-Status: GOOD (  10.36  )
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

On Tue, 6 Oct 2026 at 15:15, Oliver Upton <oupton@kernel.org> wrote:
[...]
> > +
> > +             *vcpu_cpsr(vcpu) |= PSR_A_BIT;
> > +             __vcpu_rmw_sys_reg(vcpu, SCTLR2_EL1, &=, ~SCTLR2_EL1_NMEA);
> >       }
>
> Urgh, I hadn't realized that PSTATE.A is still modifiable by userspace
> prior to KVM_RUN. In that case, I would prefer the vcpu_has_nv()
> approach that I had recommended as a backup.

Sure. I'll respin with that.

Cheers,
/fuad

> FWIW, since pVMs do not implement FEAT_SCTLR2 it should not be able to
> write to the register at all.
>
> Thanks,
> Oliver

