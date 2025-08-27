Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB8CCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 11:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L15Arz81Z30MVx1lCU/2oYRdJtFL8pfA5TQ/Z4+kAdg=; b=rvpsOnp9Xa+H6H2pquFRlSveBz
	Hxf2VqYYmtsYKkcyuXIfCocleAUHZw/QCSqb7OvEgJLj9dvvHsVL5ewJOC4s62rU5CBs0EpmouUgh
	KLV4yA19ib6AWU00IGfnC1XhvnkuiP1aHzf/JZuGdhlZP9V/iNN5Zc1Jd0gd60ecXV3QTnH5ZtwUs
	YqT8VnXAeTu2bYxvxaHccCD15cuk54MZ4nFP0hyVIZO+puOCZLyVEJ0nD2yTfobjI51Tnoy1H6S2W
	SuDbLT7kQpt6ePwAuAUtL0vye+5Kg8MsAsPNJc0mtmAl+NDrzENjv68cGOLZ4apkniCk/w3iS+7vx
	pvmHTCFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urE19-0000000FBx3-1K8C;
	Wed, 27 Aug 2025 11:08:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urDFd-0000000F2Q9-06dM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 10:19:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EE98214BF;
	Wed, 27 Aug 2025 03:19:22 -0700 (PDT)
Received: from bogus (unknown [10.57.57.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DCC4D3F738;
	Wed, 27 Aug 2025 03:19:27 -0700 (PDT)
Date: Wed, 27 Aug 2025 11:19:04 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Shijie Huang <shijie@amperemail.onmicrosoft.com>
Cc: Jeremy Linton <jeremy.linton@arm.com>,
	"Christoph Lameter (Ampere)" <cl@gentwo.org>,
	Huang Shijie <shijie@os.amperecomputing.com>,
	catalin.marinas@arm.com, will@kernel.org,
	patches@amperecomputing.com, Shubhang@os.amperecomputing.com,
	krzysztof.kozlowski@linaro.org, bjorn.andersson@oss.qualcomm.com,
	geert+renesas@glider.be, arnd@arndb.de, nm@ti.com,
	ebiggers@kernel.org, nfraprado@collabora.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: defconfig: enable CONFIG_SCHED_CLUSTER
Message-ID: <20250827-mushroom-of-heavenly-efficiency-f0ebbc@sudeepholla>
References: <2d9259e4-1b58-435d-bf02-9c4badd52fd9@arm.com>
 <20250813-gifted-nimble-wildcat-6cdf65@sudeepholla>
 <d172f30d-28ad-dd46-1385-f010107bc789@gentwo.org>
 <c45b13b9-52ae-a52b-ce39-77f7ebe09507@gentwo.org>
 <aJ20imoeRL_tifky@bogus>
 <97278200-b877-47a6-84d4-34ea9dda4e6b@gentwo.org>
 <20250815-pheasant-of-eternal-tact-6f9bbc@sudeepholla>
 <1097a1d1-483d-44b3-b473-4350b5a4b04d@arm.com>
 <20250818-mysterious-aromatic-wasp-cdbaae@sudeepholla>
 <bdfdc220-63d8-45ff-a475-41a6a63e61ff@amperemail.onmicrosoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bdfdc220-63d8-45ff-a475-41a6a63e61ff@amperemail.onmicrosoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_031933_112950_0282E311 
X-CRM114-Status: GOOD (  16.00  )
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

On Wed, Aug 27, 2025 at 10:33:17AM +0800, Shijie Huang wrote:
> 
> On 18/08/2025 17:33, Sudeep Holla wrote:
> > >  From a distro perspective it makes more sense to me to change it from a
> > > compile time option to a runtime kernel command line option with the default
> > > on/off set by this SCHED_CLUSTER flag rather than try to maintain a
> > > blocklist.
> > > 
> > Right, that makes complete sense to me.
> 
> Anyway, Peter is also try to make the SCHED_CLUSTER as default for arm64
> platform, please see the email link:
> 
> https://patchew.org/linux/20250826041319.1284-1-kprateek.nayak@amd.com/20250826041319.1284-5-kprateek.nayak@amd.com/
> 

Yes, I was cc-ed and I am following the discussions.

-- 
Regards,
Sudeep

