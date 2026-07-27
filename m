Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 965CEC531FC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 06:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uj0dW1/cUOSptKugRvHnG1G86d/08F19sM+hIpNCDkY=; b=AMvKH/7C+vt8ZIdAbnolkVfnVL
	PaAxpobhzMHfmgoEqZt10k4PyGasByvhz4GCkW6kvd9pquddgmREctdSr/NmbmfcTSKlN0r8cGDEr
	6wQ5NhZArxsFiUc5qav0pVe0Z1ULUcFS0mRM5p+g+RXmVVEHu4WlVUZysgZsbc+oikk+cq1oQV6VD
	iKzv1GdLIQAqRNyN1Wi6SJfct4RXcJWOOh+5BJbQXByd0SgzxDXIotJmgoovftAijOiSC6RX5fvmk
	sEqiy4quw9eGD7rzGkFlbd8GVFoKGOz/MCGyli9HH7Yfkfk6GAIJwIUcZbK0B/n8Y7BgGeuN0LWm/
	hK8PBLiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woElY-00000002147-0KRy;
	Mon, 27 Jul 2026 06:24:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woElW-0000000213c-43J1;
	Mon, 27 Jul 2026 06:24:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B699340085;
	Mon, 27 Jul 2026 06:24:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A4201F000E9;
	Mon, 27 Jul 2026 06:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785133482;
	bh=uj0dW1/cUOSptKugRvHnG1G86d/08F19sM+hIpNCDkY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JLYpDhlcK2qVtLl7HKfvmO3THxWACz5O/Os6Dg5cUPh4ETa7C1R+siuKFlY5W/2u0
	 reiyj9fIMuCnw9P+4qs7RTDXcfMuX87Pk6kxnaZ+UDVOByOkcrKLxg3eJjTLxbLFMh
	 PU2NnYXGOvuM5c25KsRqUV9aEYspeeIaQyzO5FC746tl9jfn/Ct7Vmf2V+w0c9TVa8
	 mlQGrkmGxHlyzK6ssfGXBmdG085x/GIkE4klKvr6Cp4I+g62uxSFK9EJnoySwl/bfb
	 OLxW79Id5EGPI3qm7h1sWe8neaur8gACDq9KaAMBjqzpMcAjW3YbKQxQ8D9wXJWLYS
	 1VuGgQT8BuGTw==
Date: Mon, 27 Jul 2026 08:24:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Zhentao Guo <zhentao.guo@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v6 6/6] arm64: defconfig: Enable CONFIG_VIDEO_AMLOGIC_VDEC
Message-ID: <20260727-vivid-native-bloodhound-4c7ff6@quoll>
References: <20260724-b4-s4-vdec-upstream-v6-0-6072a7ee7428@amlogic.com>
 <20260724-b4-s4-vdec-upstream-v6-6-6072a7ee7428@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260724-b4-s4-vdec-upstream-v6-6-6072a7ee7428@amlogic.com>
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

On Fri, Jul 24, 2026 at 03:04:56PM +0800, Zhentao Guo wrote:
> Enable the Amlogic V4L2 stateless video decoder driver as a module
> in the arm64 defconfig. This driver is needed for stateless video
> decoding support on Amlogic SoCs.

Which boards use it? Look at `git log` to learn how this commit should
be written.

Best regards,
Krzysztof


