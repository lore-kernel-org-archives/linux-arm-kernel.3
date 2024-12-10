Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB6DE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 08:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E1tVYYNqdW40wZOm1cKHGkmvF4570D3DznXRZkS2frs=; b=FXWbXnys8OkoCN9nvIyKdUwPgN
	ArIOlUYCSmFBcMbdCfKAtatAmK0naAP7bMmFAAn+icSXkAdqqF9pY16Jpd/7CYWQi9hMrC+N9US9X
	vaUL9MK2wffyTBwde1wwACd3qfVesWHd1lChoUVk7dOxYCOWgBrLEke+PnYo8wLPZnyNnjSgZnGqQ
	7JLXmomkFRRhJMptAS1Kag1AxV/2yW7BNI9fzDxFA8zZjooaLC+LUs4sF8JNHxbBDdmHTycX5OMPR
	il7BNFzEn7nVmUMm2T72j2rq4ueNm2hiGbJ0YclqxYdNOh5y1nfyH0PIkvx72x5fNilX0hiwwJHJw
	TOTm8L0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKvjk-0000000AjXd-1sIr;
	Tue, 10 Dec 2024 08:36:56 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKveg-0000000AiYz-3G8s
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 08:31:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7247EA40C04;
	Tue, 10 Dec 2024 08:29:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBF6FC4CED6;
	Tue, 10 Dec 2024 08:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733819501;
	bh=IqvKMQWSIXJGAccIjtznu0gLl18o7vkKcnIk+pvfNsU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DLfoiTtu9dVkcxrI2fiP4olwKnTPyIpwXDzUpCFZRWrqiycSB9OYhYhsafMyKWGXL
	 2m+PvncE+Whi0J1BQkp4cjeqUDdo8Tg9T4bdtk6yOR2OxV5Ma71vhaanLX2N/hCrlx
	 C8M5jso6qT2ocFzgFPhWKwPwGLHeD/JPlYi0qtj0WggqgIVUjdm74I9RiwjOxCfWqV
	 RsHMbMBWS7gUVfyxHsrqkWEVn+fnAANYJ3JoLgM3mYk5YRQUBg42KMMePzRD1mwsIW
	 BSZsWuwJfAvmLSMd7luXH4ANGCxASyljcXha8B1VFhPVSY+x4fhOM90iPNLLt/V2Ss
	 4QQLByiWA3LFw==
Date: Tue, 10 Dec 2024 09:31:38 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nick Chan <towinchenmi@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>, 
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/3] dt-bindings: leds: backlight: apple,dwi-bl: Add
 bindings for Apple DWI backlight
Message-ID: <okhsrlpr6qu6crzzhqzbvgwoqwcxefynceje6pyttb3x57vrsf@hyilj6xo23t7>
References: <20241209075908.140014-1-towinchenmi@gmail.com>
 <20241209075908.140014-2-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241209075908.140014-2-towinchenmi@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_003142_877405_98694A06 
X-CRM114-Status: GOOD (  12.25  )
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

On Mon, Dec 09, 2024 at 03:58:33PM +0800, Nick Chan wrote:
> Add the device tree bindings for backlight controllers attached via Apple
> DWI 2-wire interface.
> 
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> ---
>  .../bindings/leds/backlight/apple,dwi-bl.yaml | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/leds/backlight/apple,dwi-bl.yaml
> 

<form letter>
This is a friendly reminder during the review process.

It seems my or other reviewer's previous comments were not fully
addressed. Maybe the feedback got lost between the quotes, maybe you
just forgot to apply it. Please go back to the previous discussion and
either implement all requested changes or keep discussing them.

Thank you.
</form letter>

Best regards,
Krzysztof


