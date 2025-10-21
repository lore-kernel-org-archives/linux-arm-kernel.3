Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D79C6CCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 07:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NGyjkSZ2MHBpX4S/d4N41noq52OEbJg/dosNCzgIS7g=; b=TE4HfgLyGHSQCt08Cn54s/VRgh
	imcqutWLW/FcyQ8xnPMydcZP8lhxehqgXsOd3BQ54ZOg3O+xoAXz08veeZi5YN3yym+pzCxdqYoH6
	agYwAg+qpmGLaciulFcXb44PPUj6z/JCmgaQum4UNvkMJlTsPb2WQMua45/VqX+J2ydj+mG8rDW4N
	rACRpRG4tKj7AfaMXbQlMn/khWY7g+2TCOYtx6fUNnbOfPcaBNIOxhM5pzt8hyTpCb8hoq2DMe8ZW
	FkmvjPKGFtEnCPm+U0RIUOU1W6jLQOzx29pPEL3I281POzkgibMqNNDbGUzCLTCkNgo8QycyJj0Vp
	9dEFrwxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB7GC-0000000GCBs-1Jcq;
	Tue, 21 Oct 2025 07:58:24 +0000
Received: from mail-m16.yeah.net ([1.95.21.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB7G9-0000000GCAz-30y6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 07:58:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=NGyjkSZ2MHBpX4S/d4N41noq52OEbJg/dosNCzgIS7g=;
	b=gfmS6t/lm5O2XjW2haElHlbO7Ueq+vZn9IEyOS2Dj2blBzcMIOcBF2NyLo8Aty
	tET5fRG7NPbRmf98hA5G5nf46VIFMOHhbEWe8EtfUKD7IPohDYDcAQa3UQcydZUK
	2Hp8erdPq686y2WsfLYMvswsaEd5GIGfvbaJJZa0Y6QiI=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3v68NPfdoXq5dAA--.46055S3;
	Tue, 21 Oct 2025 15:58:07 +0800 (CST)
Date: Tue, 21 Oct 2025 15:58:05 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Mathew McBride <matt@traverse.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>
Subject: Re: [PATCH v5 0/2] dt-bindings: embedded-controller: add binding for
 Ten64 board controller
Message-ID: <aPc9DU4zVlJ7eeA_@dragon>
References: <20250918061441.5488-1-matt@traverse.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250918061441.5488-1-matt@traverse.com.au>
X-CM-TRANSID: M88vCgD3v68NPfdoXq5dAA--.46055S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU1-eoUUUUU
X-Originating-IP: [121.224.201.6]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNg9qz2j3PQ8CUwAA3g
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_005822_106163_E667BCB4 
X-CRM114-Status: UNSURE (   5.96  )
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

On Thu, Sep 18, 2025 at 04:14:39PM +1000, Mathew McBride wrote:
> Mathew McBride (2):
>   dt-bindings: embedded-controller: add Traverse Ten64 board controller
>   arm64: dts: ten64: add board controller binding

Applied both, thanks!


