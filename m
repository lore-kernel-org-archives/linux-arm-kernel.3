Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DE4BC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 16:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P0G+yYadJWDhMsM9S6K3wOyG/oWy+c8825+nanSQpks=; b=Qh6fjGMxHYEXLDKZfrT6+LkxcZ
	kxXDXBBg9+ztXWNiyq8Ezb+Qwy1bc3Cyu+Zi095fjA4gkc8QaOULat4/KQNwbCEIx0WX9y5CfhKvP
	b5XaX/k1RXGqzPZJx6pM6CVALWso58VmLZxB3jbXXVChvN6Hiw/g+JcxQJxwB8q1KQtqsdsfEdHFs
	pq/ILKNUrQutxNWLxSBEmPwodiMLLskVCGY6DdoP5iJKbY44e0uTvd4GhVcY5DJz9sDrUGJoUbhjJ
	mi8UAVSQK+UjoYtBQKKvhyNv3tamrbK2XpYzInUklZwHZcCwsAeiVaWwkdscn+ZpYoS5gAB+y50kf
	wuRs3bNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiFIh-000000080fn-36H5;
	Wed, 12 Feb 2025 16:09:23 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiEy1-00000007v21-2pUr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 15:48:02 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 364144416E;
	Wed, 12 Feb 2025 15:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739375280;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P0G+yYadJWDhMsM9S6K3wOyG/oWy+c8825+nanSQpks=;
	b=mXvv70m2Am4yO9Kvh96qPNwuxJRncLele/NuEh6/2t4WDnmi3Z/YfV9XJ2Sc+NNlAW0FgG
	7hxEycTIR8B7mq2rLD3m96VSZMlRCDVvtNR9IBwJNWyRy4Pn7VQaOeOhgeNU/N/dFdaHVl
	s+/443rY8H5dyrNEHa/6aNADLCq0wzn7oTBUF1MwUAdluXbD+hW2ESqaNHFvMtwvDuSLDg
	MYi+Ord8vFvRNsqeodt+svNBmSq85ft2DTI3BGiwtT0pIUpdrIoqKUTKpraxtbIn+5K08P
	hfH5ZQyps+2ZiKs537yNF+taQyBpbRY6dPth7dbiUyFT0Bhs7BFXZdYO6rVQtg==
From: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Date: Wed, 12 Feb 2025 16:46:31 +0100
Subject: [PATCH 12/12] MAINTAINERS: add entry for new wilc3000 bluetooth
 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250212-wilc3000_bt-v1-12-9609b784874e@bootlin.com>
References: <20250212-wilc3000_bt-v1-0-9609b784874e@bootlin.com>
In-Reply-To: <20250212-wilc3000_bt-v1-0-9609b784874e@bootlin.com>
To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>, 
 Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Ajay Singh <ajay.kathat@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Kalle Valo <kvalo@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Marek Vasut <marex@denx.de>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org, 
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeggedvkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeetlhgvgihishcunfhothhhohhrrocuoegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeevgefhteffuefhheekkeelffffvdeugffgveejffdtvdffudehtedtieevteetnecukfhppedvrgdtvdemkeegvdekmehfleegtgemvgdttdemmehfkeehnecuvehluhhsthgvrhfuihiivgepkeenucfrrghrrghmpehinhgvthepvdgrtddvmeekgedvkeemfhelgegtmegvtddtmeemfhekhedphhgvlhhopegludelvddrudeikedruddrudeljegnpdhmrghilhhfrhhomheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvgedprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopeguvghvihgtvghtrhgvvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdpr
 hgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhuihiirdguvghnthiisehgmhgrihhlrdgtohhm
X-GND-Sasl: alexis.lothore@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_074801_840214_4F2C290F 
X-CRM114-Status: UNSURE (   8.37  )
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

Add MAINTAINERS entry for the new bluetooth driver in
drivers/bluetooth/hci_wilc.c

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 82b227c3939a49996498f4e829541eb5380ab2b3..2f02aecc21e96a2f9e6ff2de3864bb2d2b964127 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15526,6 +15526,13 @@ L:	linux-wireless@vger.kernel.org
 S:	Supported
 F:	drivers/net/wireless/microchip/wilc1000/
 
+MICROCHIP WILC3000 BLUETOOTH DRIVER
+M:	Alexis Lothoré <alexis.lothore@bootlin.com>
+L:	linux-bluetooth@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/net/bluetooth/microchip,wilc3000-bt.yaml
+F:	drivers/bluetooth/hci_wilc.c
+
 MICROSEMI MIPS SOCS
 M:	Alexandre Belloni <alexandre.belloni@bootlin.com>
 M:	UNGLinuxDriver@microchip.com

-- 
2.48.0


