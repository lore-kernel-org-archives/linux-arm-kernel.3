Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E32B0E6C61E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 09:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hoQL8a97iv7n5y0TiLbPtIwDXbMWUeZLDYEa0L+TMpw=; b=G0UAf29JoYk2i/iaeCXByJZR0g
	fDik88p18riGEROxfazel8GQX/kocCnEwouHTSacLn2GlILiWVDKSEQr3qohqdTttKTANOOdiGiiP
	c0RsO1GzyIegDgB45kmTqIMtaBcNIihZ79AxYH+FFUqmxeiaINjjyK6QIIOWa8zT/8h6C2kBQ8Q53
	auXKIgRMst3kzrG3+QZi3AuN4dIjdlirhuaz8wM2XyQh0RUdDyy4dbYH8ntGexClie7XmbvAfQ3T8
	DirXdaVW80YqqE2xSf4JO/rmDGHb5N7uH+yWjJjmreZmpv+U1Wnc5wahnG6vet7q3tvg0UNljoFSF
	lzqoF4cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIOxV-00000008pM9-0N9z;
	Tue, 03 Dec 2024 09:12:41 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIOuP-00000008oW9-3CEg;
	Tue, 03 Dec 2024 09:09:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733216968;
	bh=43dP5gag6479cvqOzhHxvQanA/N937ViWuDqgCPC94c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oVSy9zsLRzL7lbm5YQreVe75XNM5I+OGg+cqJp2cNUkIKz4gw48K0CU6CtQ18UuAk
	 DtykMVrzqQ2pF9B9qazwHq1ZJkePHCW0Df4ryjKRnflieg/avxVuITqq+am8zVH9qi
	 U6fIPgNSra0WDXbatW1OONxQF9mG2jHSAA64bJJQb0jGaAxXht0Kt6tX3rBlI+501V
	 2Tly3NxJr3synyy6JxW3dJlOihwUgqH7Xx+O0ux7Z9E+rueKIRtXv9JfSuJ2IPzEzT
	 T480lbh/9f1GFhg0e0uaHUHfekeKzwPh/Uty/8CkdTbNptoX7voNUBSETNm6RAP382
	 gvFbIXomGJi2Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B0B0217E14FB;
	Tue,  3 Dec 2024 10:09:27 +0100 (CET)
Message-ID: <9c560103-4930-4cdf-b7f5-1c75785b7216@collabora.com>
Date: Tue, 3 Dec 2024 10:09:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] arm64: dts: mediatek: Add exton node for DP bridge
To: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, wenst@chromium.org, hsinyi@chromium.org,
 sean.wang@mediatek.com, dianders@google.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20241202032035.29045-1-xiazhengqiao@huaqin.corp-partner.google.com>
 <20241202032035.29045-4-xiazhengqiao@huaqin.corp-partner.google.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241202032035.29045-4-xiazhengqiao@huaqin.corp-partner.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_010929_944844_040F6B09 
X-CRM114-Status: UNSURE (   6.01  )
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

Il 02/12/24 04:20, Zhengqiao Xia ha scritto:
> Add exton node for DP bridge to make the display work properly.
> 
> Signed-off-by: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



