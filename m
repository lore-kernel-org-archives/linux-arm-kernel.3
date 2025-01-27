Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE127C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 12:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=z8eYln85d4V0XxkISkF3B47hIlXSQBbJiZ4zG36gYUY=; b=4JL2v0yosHcwWc
	QQcDA/ibCa0IKrah6IV6lyb5tEjkmgdm9HsUACG9kVvC6Ng3E8wahLXiFK4Gey9ApEDLww+tMASJK
	O09YwJKrsZayz+dg7GrNjTm4thp0rexRuy/6NG/mFAbHKTSVLk9HBjlmjy/VM6T3JF+B664JXTcXN
	0eFcjANTmeHp7S9PrTTSnuR5nvuvD/k5rlnE93/sEoIBB2VwepghUM//0Tf4SfbJVWL4ZrxKiqiwT
	ZI42RMcvgyW4Z0qBjAfnnwvwuel3gO4oGoCb9iCkkspe+ns8MdxEPFJJKNteTlRJmyxSd9TAMrHCo
	SQ01+KAkF7q6dhF041kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcOX7-00000002IgQ-0pI0;
	Mon, 27 Jan 2025 12:48:05 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcOVk-00000002IFj-0sOW;
	Mon, 27 Jan 2025 12:46:41 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43624b2d453so47723805e9.2;
        Mon, 27 Jan 2025 04:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737981998; x=1738586798; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z8eYln85d4V0XxkISkF3B47hIlXSQBbJiZ4zG36gYUY=;
        b=NVaCSbi3ANWaSVlQykC8rU+akfBpp+6CDSRLs0MWMijfwZz1cPAi4eSXhOeScu11tg
         ey0v47fqsZ0YZViHC64T0CHxksFvyKZKR/Wgu5ntvlnXzDpae4YqhyNesIi60TdfeBe1
         mN+0qSVlJfyBpONqzEVPy38eyo2cWSDlMeqCzgRAY6U1uZug5rro7po0XUj01z6OPhht
         z/bJCzXYD1LusYAjpJGx1upram53EMU6CM+S2G/AfVK5rjmknpTlBLdrQUyIHyke+4pg
         eskwqt/eZM3+10M5xYescGVOH1kUg41GoZKWGIZeo9mHQG/x4143WfSmTYafOnch9xYW
         jcSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737981998; x=1738586798;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z8eYln85d4V0XxkISkF3B47hIlXSQBbJiZ4zG36gYUY=;
        b=NfY9yaAYE5l3s7gChZM8tdnC/9YWAoYFHvvC9yoqd2QTX51NFTP56bE1peBZoB5+q9
         y9eUM00w2n+FWlKvMRMWC9yYnyc3ZaAgl0xtsgJ7viB5R7vGqE8E5PKCf+w4IytwklQ9
         GR5dYq6zqmhtki8+vhLFgGwujBYJhfTYdZs1EkmaB6493v8/jc0pOEC0pMBf90TAaewt
         Zu5/g83Z6Invxn8xEGoGLM0hzzKHvNDlwD0MS8w/WrfPDswO3mE0B8ocjrsgNVDLsgIO
         1WZn0OcE6jFH3O4Fz/B4JJ3+F2Mslq9dZ1LwnDZEWWUmXuGy5cONH4KTS8DOYuQ1evJm
         vxmw==
X-Forwarded-Encrypted: i=1; AJvYcCWOAVgrpdDiMVjMNBG/Sp+TKqLET4d6P7WTMflycMES1Q54WWjw69EmNDzypgGNvgxktBc+Hhf5aeuWDEm1Nh7P@lists.infradead.org, AJvYcCX2pxhsXKqfhkUGpmkPuLMejyCfw77U1t/51W5YRONeqAbhWoClp3tg2AHMvZoHFmZBRSa+u3lZWbM/57Ro4fE=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywm2e1yS1SA2fUx0knYFWsDJnlFpWWBpG9IwJVrZaQDZMvlMEvj
	GMlmAWqDA7AedoT+9uWI3RQmrL7RxDkKTzjDBLmthFsqWESYADtz
X-Gm-Gg: ASbGncuTi49gkxKYAHDl1CqvCAq1nk+3xL4IGn86pTxwmUWcXSnlssyM+6zBY/0Xlnq
	lSAEKAkFvVDZsMv8qsmhuslzXWiw+T/hnAH8grQ2G10ee6Q3ixMriXTmNaKTiWLUaSVfwnBQYwE
	NZkDtQom5iD7aed+wQthl4EULfv+Kb+RnsLp0yx4vrC/tdD4v+Hz2AEE8dXvLK4QR8PToPAZa4q
	coGPqe7qqcKxpElxzL59FQa1cYnzVilI+5yjPlIJw9fgxpNgGYigTWCHYaxe7OlES5lmj1onX0b
	yKSG
X-Google-Smtp-Source: AGHT+IFfSd38Ri9jN8sfQ5L5B554TUZX0q25wsFyyX/2uMgyGS67py+XFULHlQy6v7HbU7SVRYe6KQ==
X-Received: by 2002:a05:600c:3495:b0:431:5c3d:1700 with SMTP id 5b1f17b1804b1-4389143b450mr317083695e9.21.1737981997803;
        Mon, 27 Jan 2025 04:46:37 -0800 (PST)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd4b9990sm135476565e9.29.2025.01.27.04.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 04:46:37 -0800 (PST)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Subject: [RFC PATCH 00/14] AHCI power management cleanup
Date: Mon, 27 Jan 2025 13:45:55 +0100
Message-Id: <20250127-pm_ata-v1-0-f8f50c821a2a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAOAl2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDQ0Nj3YLc+MSSRN2UpGQD8yTjJIOUNGMloOKCotS0zAqwQdGxtbUAIVP
 XsFgAAAA=
X-Change-ID: 20250113-pm_ata-dbc07b3b0df3
To: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Viresh Kumar <vireshk@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2376; i=rgallaispou@gmail.com;
 h=from:subject:message-id; bh=RfFf9mqe7wnUpvIjSrHj6CQMvmZLwVEjIiP2MewLm8g=;
 b=owEBbQKS/ZANAwAIAechimjUEsK1AcsmYgBnl4AqHXy802/pdPDCEw20R6+hBBw+dOLQVfY0K
 QKOcufY0oGJAjMEAAEIAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCZ5eAKgAKCRDnIYpo1BLC
 te79EACIeSoH/vfRi6LCb3ARwUq4Q7HhYCKxv2xDX3f+4IFS6pryCyaXp3kgdqBqgNYaMdQ5ShF
 VKytt+DR+0DGoHcn+C1yMz3KxmukzDBedfB8k+fdD5hjGgh795mkqmPw6E5AETkN6odr6wAyzIg
 tWrhzoJpeY6SH+gkPflAR3Tc/PXkxWMQgV5zCrvWb3KmYDX/BrBPHX0A6LwyF7L8v6t4As3cIHH
 QC+bBsP+G0uA4AFupeTs/LMOX+UkfCKthpVUYsspVDUpXv6ntLa/zQn8F2lhD4b3U9cP5OchTmz
 g76Etrn5y2YHML03AKRXgtNpQNcpyedeIHMY7I4EcyKhK/dka5UTl/sM1W18Js+vQUbDo+OhEQo
 uerK1Ke58MwavucFUFK+hmqJtJJXwhjOqUUzAFRoVSWNLuod0jGTTB1rGC6IasIdP3cSsOYxpF3
 AJqZ0p8Vpad0JWvKza2mYOsdtAMvX4ym8T6iwt70ipD2TONcNxhaNuLJYc5Ae3zvTgE6kjd5Uph
 hS0V69QysEsSK6BhUOHKlR5Y6G3/nhCSvV9iTjMhfMP+MToZO1ZCZrKN/J3FtuVHDDZHeNHTZ49
 sMTOG3cHWP5kkCzdI0rnBPZAVzQlmyvrDmr+O298eFnNIKSWDq21+i7ubogmftWYSINmMsEQ2j5
 VG38IVjlMtsqAIg==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_044640_253863_D4E2F881 
X-CRM114-Status: UNSURE (   9.32  )
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

Several AHCI drivers expose suspend/resume functions in a way that can
be simplified.  Using pre-processor operation can lead to errors, while
relying on automatic kernel configuration is safer.  It also shrinks the
kernel size when CONFIG_PM_SLEEP is not used[1].

This has been compile-tested on x86, arm and arm64.

[1] https://lore.kernel.org/lkml/261f9fac-82de-4f39-bf5c-cdfcee917588@gmail.com/

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
Raphael Gallais-Pou (14):
      ahci: brcm: Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()
      ahci: ceva: Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()
      ahci: da850: Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()
      ahci: dm816: Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()
      ahci: imx: Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()
      ahci: mtk: Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()
      ahci: platform: Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()
      ahci: qoriq: Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()
      ahci: seattle: Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()
      ahci: sunxi: Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()
      ahci: pata_arasan_cf: Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()
      ahci: pata_imx: Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()
      ahci: sata_highbank: Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()
      ahci: sata_rcar: Switch from CONFIG_PM_SLEEP guards to pm_sleep_ptr()

 drivers/ata/ahci_brcm.c      | 6 +++---
 drivers/ata/ahci_ceva.c      | 8 ++++----
 drivers/ata/ahci_da850.c     | 7 ++++---
 drivers/ata/ahci_dm816.c     | 8 ++++----
 drivers/ata/ahci_imx.c       | 6 ++----
 drivers/ata/ahci_mtk.c       | 7 ++++---
 drivers/ata/ahci_platform.c  | 7 ++++---
 drivers/ata/ahci_qoriq.c     | 9 ++++-----
 drivers/ata/ahci_seattle.c   | 7 ++++---
 drivers/ata/ahci_sunxi.c     | 9 ++++-----
 drivers/ata/pata_arasan_cf.c | 6 ++----
 drivers/ata/pata_imx.c       | 6 ++----
 drivers/ata/sata_highbank.c  | 9 ++++-----
 drivers/ata/sata_rcar.c      | 6 +-----
 14 files changed, 46 insertions(+), 55 deletions(-)
---
base-commit: 5ffa57f6eecefababb8cbe327222ef171943b183
change-id: 20250113-pm_ata-dbc07b3b0df3

Best regards,
-- 
Raphael Gallais-Pou <rgallaispou@gmail.com>


