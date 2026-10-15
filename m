Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FB8CCCA464
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 20:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qEg8SNAdAmVhhOprukrbfpGBzD2vq402qoyCsgGvGtQ=; b=uW4qB9gVVPj3F9murDYVtfsnjA
	fJrVpIVwZgt7LmBx0IAIalSUM6FR9eWm5nyLRYejn+FEk63KbeWSbpM2LyAt+4EtEfcveoOu0fV1/
	yNryopz9pqpwDj9pIi3FFe+4a32QrLi7TN8A0JTCEeCQVMcS929/1r2Oz4HNhOi2o4eLKPHd2kZOg
	QVEu+n+hAUO+/avVeiIZgMSgI1vH7UAjCGRJmpFOgqTmWlcJdb0ARZA9FCMtjxoGo2mLTUYtajtjS
	H10X1XAGzvAGC+ulPyZvLWD9IjOnkSw6jEyDDd2YbEwWipmAvKFAdiJ1OBhsh2nslR3uTsSv4hLpw
	AMj7sCOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHS4b-00000001LKw-1PGw;
	Thu, 15 Oct 2026 20:29:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHS4a-00000001LKl-0Qou
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 20:29:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 81DA044057;
	Thu, 15 Oct 2026 20:29:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 268A71F000C4;
	Thu, 15 Oct 2026 20:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792096147;
	bh=qEg8SNAdAmVhhOprukrbfpGBzD2vq402qoyCsgGvGtQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fFrc85ch4oOXZx28Gohm1eykD+7nlTOIl0hB+tZf5YWMNqv9W6JoMa3LgdmkvDQ2+
	 mTyEWfeyQMZtRHwuo6VpBJZUA6ulxb+WqE+FFCeSArAsQWWAD/vQWU7dod0DQn/Jl1
	 nraUpFPUdCB6/mDjgFfQ5qXhLpq5HB7NPNeU+jeMioMkwnHarZjG3utNJpY4G1+CPG
	 8IKChr4KyVVWUjZO32L6IEzCw6np6DeEqVjKU7rs0N7FZbKbiWh6x4tUaqicKGVAZK
	 gV5L/hDUMn40YQKLD2Ednoxi08hijjWElZoIJfm2gkXBnNqMMDpv0CftvsOe7mYIeL
	 IU0aMT0hyQbMw==
Date: Thu, 15 Oct 2026 15:29:05 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Fil Dunsky <filipp.dunsky@gmail.com>
Cc: linux-watchdog@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
	linux-arm-kernel@lists.infradead.org,
	Linus Walleij <linusw@kernel.org>, Radu Rendec <radu@rendec.net>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	linux-i2c@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v3 01/11] dt-bindings: interrupt-controller: Add Cortina
 Systems CS7542 peripheral interrupt controller
Message-ID: <179209614483.3070284.7098869162392776844.robh@kernel.org>
References: <20261013-b4-cs75xx-s2-v3-0-181bb0d23f4c@gmail.com>
 <20261013-b4-cs75xx-s2-v3-1-181bb0d23f4c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013-b4-cs75xx-s2-v3-1-181bb0d23f4c@gmail.com>
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


On Tue, 13 Oct 2026 09:07:11 +0300, Fil Dunsky wrote:
> The low speed peripherals of the Cortina Systems CS75xx SoCs share one
> GIC interrupt. A small controller in the peripheral register block
> reports which of its 15 sources are asserted and allows masking them.
> 
> Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
> ---
>  .../interrupt-controller/cortina,cs7542-intc.yaml  | 57 ++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


