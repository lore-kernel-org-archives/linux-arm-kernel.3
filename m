Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A72F0E9DE5B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 07:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/NkLF4MygYy5gKmKhlqnhxgftiNvN3ddcJNBsSrhiws=; b=EK8g15COzGNqa0CuDwyMFJ33jb
	PA9nJUhKhKbWgalY9Go1cf2MwaFPZKIsHXWx6hAvDBM1zDrVm6OuH7ZJGhAOIpSoUQEf1Rsk7qX6n
	cF6TptR57YlHHVzYIPn0oggpkLGEdGETWUCga9k6AkOGl4/5bcAXt1cw48B2Dc87ghq/fv6mMSqfS
	9wZnhUBk5O5Y5XNXfHxlebi8SLz9Wyi1kjuM/7Wb2F5oij5u8RhTStbvDOsZa09t+VGLdaFQdwlDc
	IWlNnqN/FI9NSsvsWXuLFldR9UiAHtCC1rM5DQl8rNQXZx6jTS2C4eKnJiPggHG1Wt1yvZYqOO6q+
	HqGZ2kKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAjrh-00000009rCQ-1oKv;
	Thu, 09 Apr 2026 07:31:49 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAjrc-00000009rBk-0pwg;
	Thu, 09 Apr 2026 07:31:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A07BB600AD;
	Thu,  9 Apr 2026 07:31:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C547FC4CEF7;
	Thu,  9 Apr 2026 07:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775719903;
	bh=xoXaHyJutfcxSGhgHWM74nFyJDBXvAN8t1HEtk8e6vY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P1V3bA0Gzx8Fwg65L8SnBoKFD6eyiea3S/Y2uxq8LK+hYe0oJUYUkPN+ZpqJGS9Kw
	 txd7qibsvXqwu7xi5KYPir2Agb/zIPjfAR6CRySWRvrffJPp0rQ6jVLTlWL5t9z4aN
	 wY/ohTIkESdhFiKCEp9eBzhEl5HkEWyHKLhQLy8zQNBzJjlsaYoUkIKsYJfYI2z8jd
	 Z68yTV5jmF0LAcPe/fuCY6/c7BMtM782ASnFqB2UEkU6/Wyc8oQgO+NCpthhnxgFgi
	 n969xqxvD0SzDMwlTr3oo4RGRuNy0pVeKeETFZS5xkALG0mIaM3VC8rtdsF6g0GLwC
	 dR9q86Zb7gJUQ==
Date: Thu, 9 Apr 2026 09:31:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dawid Glazik <dawid.glazik@linux.intel.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, linux-aspeed@lists.ozlabs.org, linux-i3c@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Frank Li <Frank.Li@nxp.com>, Maciej Lawniczak <maciej.lawniczak@intel.com>, 
	Jeremy Kerr <jk@codeconstruct.com.au>
Subject: Re: [PATCH v3 2/3] ARM: dts: aspeed-g6: Add nodes for i3c controllers
Message-ID: <20260409-beautiful-paper-labradoodle-d846f1@quoll>
References: <cover.1775679285.git.dawid.glazik@linux.intel.com>
 <51c4bdc02b45f67a0e32610a228091e137c135a6.1775679285.git.dawid.glazik@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <51c4bdc02b45f67a0e32610a228091e137c135a6.1775679285.git.dawid.glazik@linux.intel.com>
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

On Wed, Apr 08, 2026 at 10:34:34PM +0200, Dawid Glazik wrote:
> +			bus@1e7a0000 {
> +				compatible = "simple-bus";
> +				#address-cells = <1>;
> +				#size-cells = <1>;
> +				ranges = <0 0x1e7a0000 0x8000>;
> +
> +				i3c_global: i3c-global@0 {
> +					compatible = "aspeed,ast2600-i3c-global", "syscon";

Also undocumented ABI. Apply this patch and run checkpatch.


Best regards,
Krzysztof


