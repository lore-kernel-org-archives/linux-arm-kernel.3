Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 689D0FA3751
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 21:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hHnpk9U01TKVp6g8rkwH31hzvc3bbgk2wSyiRciOpP4=; b=v3jxdGW5enUn4uvFmWoMzQ0x3l
	VQqSu2urDJ7rlTfU1xJW6AhB2SuuD28T0AX0s8APqMHvdQRM5+WX3AcWNeRWFaJyohjZbAjGsipwB
	RBZfAUgSFdpGE5mc/dQcRyoo6TmNNmjc9jdqbVO3u8CwngVlVzyYL09YkOuQ571KHwXLOQLikCUwV
	K9huLSDgzkvkIQx6CnOd8aHtjY3sLOYC54q23Bye4ywYNUyfJT3+fvCc4cDy10QfmITUpxPx983jo
	wx2UZs9bbfOv8RYMmk3unNSbANCAhFHcOXnD8yYcxy7JfJtE6Hr9knSnMtbYz8nnYvm6ypGKpm7IH
	EqZxqkNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbmzL-00000008jaN-06In;
	Fri, 02 Jan 2026 21:47:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbmzI-00000008ja2-2J4s
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 21:47:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C813E434EF;
	Fri,  2 Jan 2026 21:47:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73076C116B1;
	Fri,  2 Jan 2026 21:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767390431;
	bh=GMZG8PLH16vIlvLPUgb3vns8YcO90S5QJdAxIhN5s58=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NI8p/Tlm1QPYtaoRb+UtM4QqU30WGoiozGGbMODjmhChAMntrZgdFEhHGUq/gP5/K
	 Dm86SvR92EuS7A5WlKlptf1FlyZkqOCF3GP2Z618MuZ+Zhulwg1S/Eat+ub6YwSDHW
	 k0sAX/bcG4e10MXHSUIkkKvxc407jHLzkSpTW1rbQ7VpWTVI8z5vn11k5sLuSUBVZh
	 sWf3QqidKkho36OBqoLhlBhHkSb06h4smHoYk/C3TCE435oJa1/0uwdIRJdsueefJy
	 AEzFq1KL5dfM35seOI/LONS5eughR4LQdj8IKkSyHfboBmZfLpEHZN7fJK0WKoEBjj
	 SE6KwgwaLEwjQ==
Date: Fri, 2 Jan 2026 15:47:10 -0600
From: Rob Herring <robh@kernel.org>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: maz@kernel.org, tglx@linutronix.de, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: interrupt-controller: arm: Drop redundant
 node name restrictions
Message-ID: <20260102214710.GA226653-robh@kernel.org>
References: <20251231113026.2480092-1-pankaj.patil@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251231113026.2480092-1-pankaj.patil@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_134712_612555_ADFBAC75 
X-CRM114-Status: GOOD (  11.62  )
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

On Wed, Dec 31, 2025 at 05:00:26PM +0530, Pankaj Patil wrote:
> Drop the redundant 'false' patterns so that allowed names
> ('msi-controller', 'gic-its', and 'interrupt-controller') work as intended
> 
> GICv3 binding currently disallows child nodes named 'gic-its@' and
> 'interrupt-controller@' via patternProperties set to 'false'. However,
> these names are already permitted (though not preferred) by a subsequent
> pattern that applies the correct schema.
> 
> Since the 'false' patterns take precedence, valid nodes such as
> 'gic-its@<addr>' and 'interrupt-controller@<addr>' fail dtbs_check with
> "False schema does not allow" errors

The reason it is done this way is so that we both check the child nodes 
and warn on deprecated names. 

Fix your .dts files ITS node name to be "msi-controller".

If the node names are fixed everywhere now, then we could just change 
this to "^msi-controller@[0-9a-f]+$".

Rob

