Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33338CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 11:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zpjo0VqQewk15Y2hDvXnzZd+CePjbXsYiNbsvpMSSWI=; b=uPEI+JpMSkRVQZAok86+YvgGAw
	rvFfGw2EXWn5lS9JqWyef43xT/Df5uUZgUi1zMKc9HR+xDq8bl2Aw2gWBO0XUuwupCxSnU2mUzbh2
	y0JC7LXgTEaTOnl3wtUmMHZqbvCT42yIqXw5lKUpB1vpYWqRa9SCCYdwDr2vq2TGggii93h00BN4j
	T1klmgGiECw+VaHUuaYQlma3mOvwnw70z5l2y96oOXyx2UtcBqw3nfPYU/3FJ9fO0FLnWZ11GcMxB
	DDS/Ze7QlghYcTofH0KKT8zz4YHoIP3krNVjA1XUbyqWO5lJLiHhbxnzKFNq69ovhCBu1waxIk/P7
	4lyjlv7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0et6-0000000AEqD-0NNB;
	Mon, 22 Sep 2025 11:39:20 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0et3-0000000AEpp-0EYX;
	Mon, 22 Sep 2025 11:39:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758541155;
	bh=nMADfA3UKEbyqlZhjNt1e9kpbSLVmyXTD2ba8CiFz+0=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=eN1bBPagXpQJ6g9esQ4O/9Nr7/+Qeen6NJgveEIE0Nuuzj8xOa3mEPJKWOfaKBFch
	 2rB79slebeyZ+hbew8oKUfRJarLWRJ5MGg7WIDr3V9+X7YAhLWyBUHZPJndBqgRedj
	 aJ7jn7JpFUW0TMkyFTl+rT5AwrbhPaf4HNANjRym0J50NOsnFFEwEGy5s5gn6KmzrR
	 2uk6Bi8k+WbTDRL0jIl8zRjs92NAMsWH1d+8+mQzlGqjwwC2BJ9PLc6W03nOspyxKK
	 NLFB7xYaeDEOEPpnfee15g1jLRMl2Rbu3t3pkk1ZZrndGVEnClxIfNsW+6KuOaumJL
	 dHN33TNpEtw2w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9E3FA17E0B85;
	Mon, 22 Sep 2025 13:39:14 +0200 (CEST)
Message-ID: <19132a59-993e-4148-b883-1bc892183f33@collabora.com>
Date: Mon, 22 Sep 2025 13:39:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: arm64: dts: airoha: Add AN7583
 compatible
To: Christian Marangi <ansuelsmth@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250920091230.17702-1-ansuelsmth@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250920091230.17702-1-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_043917_250221_30ED5752 
X-CRM114-Status: GOOD (  11.34  )
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

Il 20/09/25 11:12, Christian Marangi ha scritto:
> Add Airoha AN7583 compatible to the list of enum for Airoha Supported
> SoCs.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>   Documentation/devicetree/bindings/arm/airoha.yaml | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/airoha.yaml b/Documentation/devicetree/bindings/arm/airoha.yaml
> index 7c38c08dbf3f..6506c64af4f3 100644
> --- a/Documentation/devicetree/bindings/arm/airoha.yaml
> +++ b/Documentation/devicetree/bindings/arm/airoha.yaml
> @@ -26,6 +26,10 @@ properties:

"an" comes before "en". Please keep alphabetical order.

Cheers,
Angelo



