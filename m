Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 827BCE77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 11:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JU+CvSSVsi3PP3YhORmJhl8AAHzLJ48TfUJOfB40OEU=; b=bzRpGU2B/S6OiWUCba3ILfIC1K
	hOpvUfRNWPc7MDD8JlKLmiJp8Q9BmxxXGyUNcGcedN8c8o+WjhqZlGk95HSxo/puJHXtcYtceEd6M
	sXFGlLV6zfnZi5t/1QF/n53EWS8mGiM63O8SFiHCZXWUPnvmd5CZPBx+WuAovlwI6/U0rFN2dDtSg
	P9Gu82BHirm8sEic3i8nY9EbnspBx3TIWNko9Bmp73K47ftcf1Q0xz5QbgaVTtB6VM9g9+cR10YV8
	QsCSieyUOMU0Rbks7NT/rM/Q+cWWBXXCSzwnIBTi85Y1+CACbXgGGndksvLXeRb0JsAEfScDJrnVx
	Zh+iYcqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKcIl-00000007Yy9-19vi;
	Mon, 09 Dec 2024 11:51:47 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKcHi-00000007YoV-33DY;
	Mon, 09 Dec 2024 11:50:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733745040;
	bh=2EW9RYFxrgic2qsmTCiUTRhYL8QZ0qEfNDT6mPIAkC8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SpuuzMHMJbY+uR7VXF8LnTPfkiiQgDmnu5T9ijGD3Ty1KgTJjda7PmxHt5gTlcJKm
	 q7C+KVbvEcnv9lumpkr2QZxaFjFlzJIEsYiaVaQd+vpX4He/fYQwBQ9wllCjXUb7ug
	 p7NdPDKzMgJ/3RxTx7ure5zY9f9/ylmBeurEQ+7ayMvF5LGcc7ry4pbI2xaw6darxz
	 YWZTMwqZBHsNbi9thB4kexH2SdWYIyhcCIV/bWDcuyRBT3EkvmgF3/1WzhheFdG5Pw
	 WFj1mm0EKyg4l31HW+c2VWLtk5Chnh8/ppyNmoHiy3EyTyUI/3DHceE97Nt9bs2vwq
	 a55EBc94b/p1w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A80E617E36AF;
	Mon,  9 Dec 2024 12:50:39 +0100 (CET)
Message-ID: <402d1717-f4f4-4ba6-b13c-5dd6e6c44490@collabora.com>
Date: Mon, 9 Dec 2024 12:50:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] dt-bindings: pinctrl: add binding for MT7988 SoC
To: Frank Wunderlich <linux@fw-web.de>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>
Cc: Frank Wunderlich <frank-w@public-files.de>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20241202110045.22084-1-linux@fw-web.de>
 <20241202110045.22084-4-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241202110045.22084-4-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_035042_934509_EC306BD5 
X-CRM114-Status: UNSURE (   7.57  )
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

Il 02/12/24 12:00, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> This adds bindings for MT7988 pinctrl driver.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

After you fix the issues pointed out in Rob's review,

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

