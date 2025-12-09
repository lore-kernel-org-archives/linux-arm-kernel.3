Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D0E9D3B994
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 21:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s+B7yMeCFPLUVQGO//UV60InuC79eMSnTDueIwdGmRs=; b=QC0MkSV0D2cdm3WkNle7IeRatB
	zpYukXoHddf/Ejz/1n6fqfFPok3cKGkC6lGe7cxFefrdTdPcMdhL2OuFn3DAvlj6oQyyRof/FAaZl
	moXN7w+oPKOcNP28iw7zltvr6qY8WlJQmNxrqrGX89056/S+269PLo5HVd7uoiUTph4vH6hNS4SpC
	6oYG46Y/98Sb0JxUZ4tknHSnV0utRNduesYBtEZgQ5C1renR3sKgQnxkeu/lyz5AW+m1tF1yoZ95E
	jRju1RVmovHwwhYmE9WnAXHSRhaxA7maSiCLcSZLGgl7Vh/Q8QocKQWfEvXel6dRkXXZ+W8l1TB/C
	ab+giyHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT53Q-0000000EoZU-45wA;
	Tue, 09 Dec 2025 21:15:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT53M-0000000EoZ0-355V;
	Tue, 09 Dec 2025 21:15:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6742743454;
	Tue,  9 Dec 2025 21:15:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F306C4CEF5;
	Tue,  9 Dec 2025 21:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765314924;
	bh=GZzlQAeYSZb5jVj++vPLnWFa3c9qeYvB2alZl24BowI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WSsQaaSox3Sv1ZZXnrjg6JPER4Jkf+EjpO/ud+3A+icp4zA7Rk8fgdQGpgJODbX2C
	 G2DbLtfrtVAQJ+puOb2xhlO6yk8SOVVy2NqKYvzQQ3BW4UwpmkxxWB0z9r+uMUEQCv
	 phYtW7NqHunI+Wt1DF6bIFlvIRzvFpJ9kqFhp/zjuVoqO0AXtgh4XGTjJtv395LO3c
	 jXbjJc12mdSfpY8VqB4VbhJgE+4OAbiwV1YsFkRXwaTkBzoBWfKaOROpZ9khgjjD2a
	 gd8spWk2HJ+N0AZMFhdzal62kSz6QGQLn8NJwVoMBKtpyuQxqPF5P43aDYbfjBellY
	 x9Eaqk/IDy+7A==
Date: Tue, 9 Dec 2025 15:15:21 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Dragan Simic <dsimic@manjaro.org>, linux-media@vger.kernel.org,
	Olivier =?iso-8859-1?Q?Cr=EAte?= <olivier.crete@collabora.com>,
	devicetree@vger.kernel.org,
	Diederik de Haas <diederik@cknow-tech.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-kernel@vger.kernel.org,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Detlev Casanova <detlev.casanova@collabora.com>
Subject: Re: [PATCH 2/4] media: dt-bindings: rockchip: Add RK3568 Video
 Decoder bindings
Message-ID: <176531492074.1107900.2748821252600292565.robh@kernel.org>
References: <20251206082809.2040679-1-christianshewitt@gmail.com>
 <20251206082809.2040679-3-christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251206082809.2040679-3-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_131524_789279_62CF7550 
X-CRM114-Status: GOOD (  12.15  )
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


On Sat, 06 Dec 2025 08:28:07 +0000, Christian Hewitt wrote:
> The video decoder in RK356X (vdpu346) is described in the same way as
> the one in RK3588 (vdpu381). A new compatible is added as the decoder
> capabilities are a subset of the vdpu381 capabilities.
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
> nb: I've chosen to us rk3568-vdec not rk356x-vdec as other compatibles
> for these chips are using rk3568.
> 
>  Documentation/devicetree/bindings/media/rockchip,vdec.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


