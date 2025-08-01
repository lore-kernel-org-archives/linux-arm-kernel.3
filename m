Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35A0CC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 12:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/qmdPRh6Cf8hysxZiP63hggNV8Z8NHhtUuFazfQfo6A=; b=g9ZkDpZuyjp7Q+uXW5/fcqR1GM
	2omHDo3rf9UNF8oTkMFs/cabJiOI/sy8g5TllR4ECx2Fc0P0Jcm2mF+26Kqo/dKREEPc7KFLW8P4R
	sfD72BRIegfwnNMdk4ksAMQT1dbkAKrGEPJNjXG8kbNFeZa+PmDiWtnIbYcvt35/xy6/3Ixsxr8cn
	Fv11yja5/qlntCYpStpmkM/t2QtzMzIcTyTdWXAm4kmH5U4URABjdE/64g/POum8q8QOVF4hx2K01
	JxaPS5eCC0olJM/BYPIWproe/kQwERT9hj+C2p64IUUStYzjLF/TK48iaJnz3hh2TJa740ZXqbsjc
	YQYBbalQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhp1c-00000005zly-1BxN;
	Fri, 01 Aug 2025 12:38:16 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhol1-00000005oy8-2dUc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 12:21:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754050866;
	bh=/qmdPRh6Cf8hysxZiP63hggNV8Z8NHhtUuFazfQfo6A=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=pz92dnm8Yo2JZFYDudphkvtf0EP1fHzriCb8Ya6SalNDaJQOd1ayHgsIC5HpylzEf
	 6fSfPF5aMQOYePYfv/hx8fg3Fh6Q/VFzsYrF5/N3CLscN+JMjjX7zVzH/WAlyir0ma
	 Zo9BGcZEqbbGDCdZHeJaShoIeGg9LDXvAUXth+M1sediLCPSL7Hw5XYi/A4vpWCBL+
	 Kha+j7CmhwebimrxwnsztXPZi/HUdmDGa0sobkkQzKdeW2OSTl298HbNpF2Ye4CoPE
	 FKbU1nfcPGcDx49+y68JDKU4TOxP1xD0rNTKyx+4BcRBfhSTORcGqpMq80E6oM2zdB
	 qU4HKQ3JDoGeA==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892F2d600c8f85cf092D4Af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 64CB517E046D;
	Fri,  1 Aug 2025 14:21:05 +0200 (CEST)
Message-ID: <7608b4ac1037b0ef92f75624f65be7dcbe07c590.camel@collabora.com>
Subject: Re: [PATCH v6 05/24] dt-bindings: media: i2c: max96717: add support
 for MAX9295A
From: Julien Massot <julien.massot@collabora.com>
To: Cosmin Tanislav <demonsingur@gmail.com>, Cosmin Tanislav	
 <cosmin.tanislav@analog.com>, Tomi Valkeinen	
 <tomi.valkeinen+renesas@ideasonboard.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Niklas
 =?ISO-8859-1?Q?S=F6derlund?=	 <niklas.soderlund@ragnatech.se>, Sakari Ailus
 <sakari.ailus@linux.intel.com>,  Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org
Date: Fri, 01 Aug 2025 14:21:04 +0200
In-Reply-To: <20250716193111.942217-6-demonsingur@gmail.com>
References: <20250716193111.942217-1-demonsingur@gmail.com>
	 <20250716193111.942217-6-demonsingur@gmail.com>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_052107_811922_3E6E7F7E 
X-CRM114-Status: UNSURE (   9.02  )
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

On Wed, 2025-07-16 at 22:30 +0300, Cosmin Tanislav wrote:
> MAX9295A is an older variant of the MAX96717 which does not support
> tunnel mode.
>=20
> Document the compatibility.
>=20
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Julien Massot <julien.massot@collabora.com>

