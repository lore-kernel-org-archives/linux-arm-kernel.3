Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D9BE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 07:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UpI1kDIDP+9wxN+lrRFVGk9iCMxhSweHXt23HZnkQJ4=; b=WUqM0K19OkNPv1FuFCTwjZY/b4
	384pohrlyR9pnecKTlt7r9HHOMBT2wdfaCVuen3ST8ti2ZKlFrtoy+IdH+xg7sWMBiRU/xSiHQ4Fl
	/6aiDSrav8foGWy/UodVZCY1nDYeqiJ7rSdTU+CXNA8fx+iuJs/2rGxHIwVUeFEGciZTZhM85QptW
	1O21Fb4NRjHCvaoxE7eTAILZ0yD41m3JhBHgnmCAQQDZB6O2Za7lPp1A9n/yX3A3I+cI0FjvoETEH
	5iA+f3UZ0fQWV0txhxlDlSCc0zxeJvPqjSa7l7Yki+Uqf/C3iGW5mV2uP5mqqhg9kcGTXrJ3Smcmv
	6fkPxzVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tR533-0000000HIPN-2YEi;
	Fri, 27 Dec 2024 07:46:17 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tR50F-0000000HHw5-0NLZ;
	Fri, 27 Dec 2024 07:43:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 83C6BA411F6;
	Fri, 27 Dec 2024 07:41:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 713DEC4CED0;
	Fri, 27 Dec 2024 07:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735285402;
	bh=UpI1kDIDP+9wxN+lrRFVGk9iCMxhSweHXt23HZnkQJ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RTfgVUPGvILnEsFCcoRqMLWP67xbeZfQ5AxICwJM5p5gNXIpmy6WVReFEwXMO/fim
	 Vk5DjqvVruX6zk2KA90RmE9AoWfZyEUl9n45OFMELB6hN9dF73mcPN340QRnql0uGn
	 suF6yCDL5bEhelQM+6X5YmeciVuYBwmlrut+IOjiT8Ch5aAU684PnzMgUw6WaMBTSA
	 3yvrKkqyHFftlk7Bo3Q1qRO4Vk1+ZfjdhULbrNJpPsy+je2xZYrE+B95NtEfbhOfev
	 XjBnFqvJE/izUqZ3ctWXFeTzpX2///ulmouwrueliBkrqOArupEQdJxx+/321v8yM9
	 PG6ttdkzMmC1g==
Date: Fri, 27 Dec 2024 08:43:18 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 08/17] dt-bindings: spi: Add rockchip,rk3562-spi
 compatible
Message-ID: <bq3jrw7r5wfzffosfh3eerngvqvd5lc6ilrnu6fstpxx5fmzm5@bdowzwie5qae>
References: <20241224094920.3821861-1-kever.yang@rock-chips.com>
 <20241224094920.3821861-9-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241224094920.3821861-9-kever.yang@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241226_234323_192165_A1586D0F 
X-CRM114-Status: UNSURE (   7.60  )
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

On Tue, Dec 24, 2024 at 05:49:11PM +0800, Kever Yang wrote:
> Add rockchip,rk3562-spi compatible for rk3562.


This we see from the diff. Say something not obvious. Where is the
driver change? Why aren't the devices compatible?

Best regards,
Krzysztof


