Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10B8606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 23:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uM3vO7/I;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eddqxx5y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sbyeg0eCrCPYafk0IrpKxi7/8K1TfJs6Osh4YuxfEaM=; b=uM3vO7/Ivu6wQ6Ag104l8gYtQG
	jq3qFjbevNRAvgGo3Z7BwQAZQoswZCloLak7gfeW7mT3hnlOYittyui8av/odrUy7TLptryKgrjN+
	g+ygN/UAGFy19/+YMAIAiwKz5+B7rT1xty5oEIqXCwn1xgoZGC2SsvLwLTcBG6j5LoKe9Nu1uZFho
	UNrkMZWqKwbLDIaulFyOn2QX5dYoIbwMkeKGn5cQrGBSqzlYjLjHnd+u5AYFrDgf2Hjh44oUAvdgy
	voSHZA8Lb7XzT2ZSViXpN/4yOeGZTQoa06fDlICA9tETZfCS7TrZAYu0zGHD/CgmAa7Fp5yTNK7/J
	labQ9SgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIwX5-00000008We0-3QuO;
	Mon, 19 Oct 2026 23:12:43 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIwX2-00000008Wda-2eXP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 23:12:41 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5bb7c6980f1so2173035e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 16:12:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792451557; cv=none;
        d=google.com; s=arc-20260327;
        b=eDhf8m8K1hwySV+Pz6/fXjTj+fTdWJCBbxTmHCor8GdjAzYnBTIya2BNTOxeshH79t
         Tz7KEmyE8qbiZQhfJhE+vg5gIOrwUHkzDGVQJGV0BaMmD5FD66ARg4/eEFuUslUfkUIs
         GJshjJcOJlE60MAYEqMqsuUVNbHhRwxufM96FYLYTDO4m/XQ45LRmmunjixKQu+5TiFJ
         +U12J7SME+HmZLX3xFxoUg4hCx3KNHsVRJlr7Mqia9ZryuIF6AHGP+o1S1ZcrrTS+1BT
         V/05vAftZjVuy/Q8qytewZCsYCr8Nf0wVlGD4fmMuhfltAvdp2rHngIYhxHOc1h82oWa
         266Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Sbyeg0eCrCPYafk0IrpKxi7/8K1TfJs6Osh4YuxfEaM=;
        fh=wK6xq2AOzE5Bfbzhz4RbeSirJxOpRUEdejK0HDXZv1I=;
        b=ljDW3KvHsjhDaFyv1MOqt/NdDkeFKvVfZPbIwtILrcKARRd+6eVxuGG8W1dh6q+MRV
         mLIt+q8y7+/SpuFzD21VVW9Y+FosoSg5qZkFPpF8bOVn5lvJ6B9p+gaIIIXbh2UnLVH1
         WcAZZAAqDz/AWSmPcof589LxSt4nhE2QO67/MSChJKp5ZA2HHpz4u8ACxHKxcR5lrvRf
         9Kt5Ov4ucCOSPpr+WJ1Uuc3Fv3MqGPzsl8BbXePd/Pbg5GyHuAr/puTHNfZBn4MJiDY7
         +RNkk3sEv6P5jzafDE/fxJQRbrRc6g18CP0QlqLV5nmeXc/PQ6m/lrppg4qOTQ/1NtwO
         W/5g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792451557; x=1793056357; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Sbyeg0eCrCPYafk0IrpKxi7/8K1TfJs6Osh4YuxfEaM=;
        b=eddqxx5yDlWVj4lWv3cNhT8S0OaBmEOqVR0j5zrnVi3nVeypG3TGbS7lnvFcwVM3ov
         3xk1KnZzT40Ahk2sX1adtFxp3KxPxXmRH6OKlktpWhLpKkAq8uAwOaO2qPV6NbkeK7SZ
         Ehy42Xw9h6ED6DNqQszviPBUeS9iT0yAQIne2+unES7TYB90Xe+XCPvbdFwTgxWsG05U
         VUJzplV8L2ZntKL5a88cyX5Ihl3HRxBkWxkFGh1E9Q5QSpYubySroicOil4egD2wlZAs
         pWFb8R0LDxffmbY6SHEB2pDvLf/M9oa1AFQd/4Im15BoiiBrx8k8+lqVqTeB+UxMyET7
         XxWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792451557; x=1793056357;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sbyeg0eCrCPYafk0IrpKxi7/8K1TfJs6Osh4YuxfEaM=;
        b=xT1tI1Wf2gpDKCnJv4UJRoK+NKD/DNLINqyE/FN5Q2cAu/FX9zFS+a+ttpGMtaZR+1
         7ZqAWUv4GFapTArEYLnf+r8XNHV9dqy06j2Lwwk9hT3xZpbizAI0Rwyn83pM43ebaRme
         yG6tph0H14ukx2SpE+pyibdN65gzLNypjF2K2flT0/VsH327f1EI4e98wGvxmQQn8oPI
         EJJ3wntuh17AcOL0HupHamc+hRABKueISymZISbsifytIW4iGV1jHr5XK72r0FVRw7NC
         PPkxqUQhvyCAe1OHq9PvZ4RUCaOGMMOeO5EGse2l1AXmT5RnhVdfC5qEIEfsWchVAPF6
         8XKg==
X-Forwarded-Encrypted: i=1; AKwUvBw5MWn8tz9aCLAQSSZnaYg3+7A2jIC1nKGI5seavbpL/qnMD8sfkLhZWJhM7vAiC64Y5vCDy0L4CxOWZG4QyvNn@lists.infradead.org
X-Gm-Message-State: AFq9FYIA2q2ORdYqtSmkUFzHh09RCCmDJfKc8+phKi9B0FeOkXfIwOJl
	mBWtsB4bSq80G6YW4rxa7aR/6wtIT4cMcguS+CBQp4nqxrO6qBK3/x6LOCTboQJf4R2ub5oc8pP
	3RkQxImrZ1E9f/MoDkkqz3C9A99aJI7ULTg==
X-Gm-Gg: AYBFou22IWlkJtPSdP9NnG36xCkTWH2rcyXQS89aDMbfZmcBwoWkytsIpJE60YPdLvC
	1gVOBDp76vrM3pdgWTv6mcugkr/PtFNM3aZboeDC8rF4UcJ4s33OMIFJ8FQxYJolYSEzBOioAiY
	OqBQ88gSvvZ/cNB08WptxnS6yzTU/AehIPy30lCo6AvGwTJUT5svmns7Ii/6EZer/u5v6VjWiFK
	FtHv98saP0lHY98ucQnVg0P7mATVKyjqJLrCbX56mbV8KEYzft1poYXgk6FkUGZ2saZsckicePH
	v9XoebRHFrhbxYbHAFchJA+qw249L2O6oPgGteMhc6gabmBcIY/oQH8+Mo0oBgCfbtd4ZHo8SkU
	Q96JMnMPhhDZKnOR1vuzJqnLKDY2/Xf6HDJ55yv7fnsxI
X-Received: by 2002:a05:6512:32cb:b0:5be:559d:97d3 with SMTP id
 2adb3069b0e04-5be559d9e2bmr2279941e87.25.1792451557299; Mon, 19 Oct 2026
 16:12:37 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261019-b4-imx937-frdm-scmi-pinctrl-v1-1-0576fb20964b@oss.nxp.com>
In-Reply-To: <20261019-b4-imx937-frdm-scmi-pinctrl-v1-1-0576fb20964b@oss.nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 19 Oct 2026 20:12:26 -0300
X-Gm-Features: AclHuK_sIDCnoT7p4C2M3ArcMmF6PmO_wm6FePSRnR_5IzyNWFoOjbw4PWCxo2c
Message-ID: <CAOMZO5D1XDc7C6H9jYTtpiPah3DnQxJz35t+3k0--a072KsMuA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: imx: Use of_device_id match table for per-SoC data
To: joy.zou@oss.nxp.com
Cc: Peng Fan <peng.fan@nxp.com>, Dong Aisheng <aisheng.dong@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Jacky Bai <ping.bai@nxp.com>, Ye Li <ye.li@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Joy Zou <joy.zou@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_161240_693184_638F7795 
X-CRM114-Status: GOOD (  10.58  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 8:05=E2=80=AFAM <joy.zou@oss.nxp.com> wrote:

> +       if (!pmx->data) {
> +               dev_err(pctldev->dev, "platform does not support scmi pin=
ctrl\n");
> +               return -EINVAL;

This NULL check seems redundant as pmx->data has already been NULL
checked in probe().

> +       pmx->data =3D of_machine_get_match_data(scmi_pinctrl_imx_data);
> +       if (!pmx->data)
> +               return -ENODEV;

Can this be NULL? If there is no match, the driver would not be probed.

