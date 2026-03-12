Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A71A31067040
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 15:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a9sYl4zF4K3PnOKsaFIhpRSekr3idKFcdKOxIuQ07SU=; b=Gf5ajiz4ZlbdsiL98JBPit0RiI
	Duc/uIEbbZ/YGR2JRCN2laHSJkl0UOXrsHtg5Bqe1lKAUk4UYBdLgPfT3d71GKTs92fGq1DlP4ekj
	MlGUdidT0K9ywJxpozfcaOo0dMxZjTMvrO0znfHQ3TQa5zgDCHUQYsh16NhdA89FFNd7Mg43zwNS7
	1Up+oH/RvZiJ35WQy9PchzKLzMKnTFD2i5Cv7T6z4Xi1nruyOwfTJbhwT6qepvf4RaSrjisCErOWr
	TpEJD4K+qY57M20aMKp5vuTQ5G/b2ify/nukfIvTdBhdcgzJRtPNvQJOXdUApZSABN5BjmScHjed7
	rc8EtHXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0hYo-0000000EIGo-1TJE;
	Thu, 12 Mar 2026 15:02:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0hYm-0000000EIEu-3Ouc;
	Thu, 12 Mar 2026 15:02:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2663244481;
	Thu, 12 Mar 2026 15:02:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0FC2C4CEF7;
	Thu, 12 Mar 2026 15:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773327768;
	bh=TpkPTB7QLdvbC4dHR6TujTwcsq+UZavtyYNcVQaIn8g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TL8L4A2J+OVcHSsW+sFEF8DX+wdUdayeayT2LpXXU/x3QX/5AbQZxSOTO9XFc7CW7
	 nDBsbE9oPxei35cVaz+0I2D/f7j+WlxQLJpEM13wAgzSSil+rJ8TPWzmwozp1WucMD
	 47NMaLwv/Sr+2TYoGCxEef/JWKlKXPvor4Vm+VzlmG9kf3bJONL5Ta4x1WXm/KhMXV
	 CMQlvBeLQyZyLQm7BU4J45zdullwA9qAtUpHbOkAdRc54N7vYsSLCGEfTe25/CdnfM
	 gzXUHulqafOUEPo2po8tFnnskkAWDpthmtT2zfyv4JC3ICEoWCq0FxbEICRJkZm2fB
	 h78LjOdVZ6pTw==
Date: Thu, 12 Mar 2026 10:02:47 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: akurz@blala.de, linux-mediatek@lists.infradead.org,
	mkorpershoek@kernel.org, andy@kernel.org,
	devicetree@vger.kernel.org, alexander.sverdlin@gmail.com,
	dmitry.torokhov@gmail.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, krzk+dt@kernel.org,
	matthias.bgg@gmail.com, lee@kernel.org, robin@protonic.nl,
	linux-input@vger.kernel.org, conor+dt@kernel.org,
	marek.vasut@gmail.com, hvilleneuve@dimonoff.com,
	geert@linux-m68k.org, angelogioacchino.delregno@collabora.com
Subject: Re: [PATCH v4 3/4] dt-bindings: input: add GPIO charlieplex keypad
Message-ID: <177332776621.3126889.16026156130288096432.robh@kernel.org>
References: <20260305192101.2125660-1-hugo@hugovil.com>
 <20260305192101.2125660-4-hugo@hugovil.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260305192101.2125660-4-hugo@hugovil.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_080248_869597_789D7941 
X-CRM114-Status: UNSURE (   8.40  )
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


On Thu, 05 Mar 2026 14:20:49 -0500, Hugo Villeneuve wrote:
> From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> 
> Add DT bindings for GPIO charlieplex keypad.
> 
> Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> ---
>  .../input/gpio-charlieplex-keypad.yaml        | 108 ++++++++++++++++++
>  1 file changed, 108 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/input/gpio-charlieplex-keypad.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


