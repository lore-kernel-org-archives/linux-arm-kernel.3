Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C38C6C36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 14:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q9Xw6f0N/jVmcfq4BQ7p0UOaBkU/oxMIJnmuoMPRYTU=; b=WZMYERL1CGRCxq4Enzw4CE5vRN
	IZSm6pDXpw/YGm/BchQLXPp9UZIYY7KeUgtp80awX2dTJwP3WCoY6VHhBqrXqWouAp0ZuM4psdpD2
	7D7eaeYztTfr+als6z8riOHWURwoR6FmwgW7sbrEpcK1SSVEDKIxVcGvfv92ejGN6f9rd6Km5EBo3
	OYCY5tVuLI5xKyls5X2qGgORyGwaGknXKJEmUnLWvYX3oTFBX0o8d6iGkbn+QHTpZr9Hdzh9Ao1qM
	s0aNZHQ0DRvfygnKb/7CjY+SkmP6K2WnYckUbc4bKnjbHDGmfLV4LqQi3eS3Sj4ScsA5VFIQsI3fh
	15molZZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twiSr-00000003Lli-31bj;
	Mon, 24 Mar 2025 14:07:41 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twiKy-00000003KS6-2GX1;
	Mon, 24 Mar 2025 13:59:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742824770;
	bh=pPpPGmbFhlnpcrD/sdzrDoBTzh8QL5fZzQQDJK4oxFg=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=NoOFdZGMVYWoM9DEu8WggGAbsUWyXP8z1gBmOVYNDchafopGHD8cg4ne8gCQsrEOh
	 JuPHDleNcmv2mZtMw280dk7j8HJNk0a2bA09/3uu/G9Uan44pDZR/7pX1/ujgzT38+
	 Rdagsu4hGj3TsONQ0hWTCj58/NVcn/+o8gN6FioqAwbbI51EgB2ciGuYEPfxVjU9aG
	 4L9msFdmuoIAAHy336MF8sXfMWPhsl469v7mWyDIQtr9FU0VZYSEtdcGCqAPkFzK2G
	 R6rVAXwgu/vjlgh73bV7Cxrpz4kZcKKNchIGPzlVxsKRAX+Ytb8w2TnpKBz7jOsxaQ
	 3TNL44MXe1f6A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3AAF417E0673;
	Mon, 24 Mar 2025 14:59:28 +0100 (CET)
Message-ID: <28135f96-ef99-4347-884d-20e870a3d64a@collabora.com>
Date: Mon, 24 Mar 2025 14:59:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: iommu: Correct indentation and style in DTS
 example
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Yong Wu <yong.wu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Maxime Ripard
 <mripard@kernel.org>, David Heidelberg <david@ixit.cz>,
 iommu@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
References: <20250324125250.82137-1-krzysztof.kozlowski@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250324125250.82137-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_065932_768321_7294B0D7 
X-CRM114-Status: UNSURE (   7.99  )
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

Il 24/03/25 13:52, Krzysztof Kozlowski ha scritto:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.  While re-indenting, drop
> unused labels.
> 
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



