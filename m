Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 018BAC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 14:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RekemI21winZSkN/4ZTNVhN87O5VbRFw+71Y2jqcSSo=; b=4w1+jIIOCrb2CCGfx4oMQ08+/L
	Lg13qGDZE97Ka9yASfjXH89eYuMP9zq1+XipziX446YSGEl2om75Ah9q6d+oRq4tD8bCMY7KKZCAe
	Ix2j+7EqISZwNJxljoQxMwliL6ryNdjs89g8WS2Q57AHNYXxvhjdF0wOfeWpnWzO3OacWUVJW62B1
	CZoy3BTeNgXvCJa5PUecXph/EZwOrtNkmwq/Ln487qftsdE/0ZtLON+l2J0Z4x/pu3Ufdz3+AOXpg
	oEqax1/srgdQTgeza8mD96n1sCf+I3godlYz7j/Rph+iDlPaw5pUW514j6jo7AY4YzM/lt/Rjhnft
	2mJDry/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzytj-00000006N2R-1Tnw;
	Wed, 02 Apr 2025 14:16:55 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzyrx-00000006MlR-01fb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 14:15:06 +0000
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZSRcR295Sz6D94P;
	Wed,  2 Apr 2025 22:11:19 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 3892A1407DC;
	Wed,  2 Apr 2025 22:14:58 +0800 (CST)
Received: from frapeml500008.china.huawei.com (7.182.85.71) by
 frapeml500008.china.huawei.com (7.182.85.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 2 Apr 2025 16:14:58 +0200
Received: from frapeml500008.china.huawei.com ([7.182.85.71]) by
 frapeml500008.china.huawei.com ([7.182.85.71]) with mapi id 15.01.2507.039;
 Wed, 2 Apr 2025 16:14:58 +0200
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Sudeep Holla <sudeep.holla@arm.com>
CC: "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "oliver.upton@linux.dev"
	<oliver.upton@linux.dev>, "maz@kernel.org" <maz@kernel.org>,
	"mark.rutland@arm.com" <mark.rutland@arm.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"nichen@iscas.ac.cn" <nichen@iscas.ac.cn>
Subject: RE: [PATCH] smccc/kvm_guest: Remove the accidental semicolon
Thread-Topic: [PATCH] smccc/kvm_guest: Remove the accidental semicolon
Thread-Index: AQHbo9Xb1Qaum+PVw0qFOb1Na1wSkbOQRVEAgAAki3A=
Date: Wed, 2 Apr 2025 14:14:57 +0000
Message-ID: <fac61876ab13495ca1b4ca2a94cc735a@huawei.com>
References: <20250402134401.146156-1-shameerali.kolothum.thodi@huawei.com>
 <20250402-independent-hyrax-of-honor-4515fb@sudeepholla>
In-Reply-To: <20250402-independent-hyrax-of-honor-4515fb@sudeepholla>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.48.153.182]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_071505_189800_364550B5 
X-CRM114-Status: GOOD (  12.75  )
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



> -----Original Message-----
> From: Sudeep Holla <sudeep.holla@arm.com>
> Sent: Wednesday, April 2, 2025 2:58 PM
> To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> Cc: kvmarm@lists.linux.dev; linux-arm-kernel@lists.infradead.org;
> oliver.upton@linux.dev; maz@kernel.org; mark.rutland@arm.com;
> lpieralisi@kernel.org; catalin.marinas@arm.com; linux-
> kernel@vger.kernel.org
> Subject: Re: [PATCH] smccc/kvm_guest: Remove the accidental semicolon
>=20
> On Wed, Apr 02, 2025 at 02:44:01PM +0100, Shameer Kolothum wrote:
> > Fixes cocci reported warning:Unneeded semicolon
> >
>=20
> There was similar patch on the list [1] few days ago.

Ah.. I missed that. Please take that.
>=20
> > Fixes: 86edf6bdcf05 ("smccc/kvm_guest: Enable errata based on
> > implementation CPUs")
>=20
> ^^^ Is this really necessary as they get backported as well ?

Actually I was of two minds on this. Not sure.

>=20
> Since, KVM maintainers are in cc-ed, let me know if you guys want to pick
> this ? Else I can send it as part of my firmware (ffa/scmi) fixes.

Thanks,
Shameer

