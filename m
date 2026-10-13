Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59FFBCC6B19
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 17:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Content-Transfer-Encoding:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y3m+IiRPjHXlRcCy5kt0s5eCMwrp2C3UhEBDizZT22I=; b=Fcx0hJmRojEneCQUcR3h8Z5suf
	dusRYGATES6yerFJstMCbruxJyVqfgBYIt+ps1axJbM07rH11aki30h0mZ3fi1TWbEjaY+hGz22rG
	ADxsqjWPaJzTXiqra/InDlzgycFR7EKImqcrE5y8uYgu3FVo3IHsY9Vfdn8wkkrR4NNFV1kbHU9AH
	uU6PzMgKnphyeGcsvAhR08O9CzfeEK0MmZUxJZfyrinFmN9n2Lanez8kOqq4uN8LYXi+SMEHcBFmT
	ivr62VoVhYK4koqQneWjq78bxdyowGUpNEfWtK0iN1ktpWiPuB9ulFhoZEkyUkIkaPn1mcQud9q67
	QEjPRHVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGgQa-0000000DiQi-3naK;
	Tue, 13 Oct 2026 17:36:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGgQY-0000000DiQE-3GsH
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 13 Oct 2026 17:36:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:
	Content-Transfer-Encoding:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Y3m+IiRPjHXlRcCy5kt0s5eCMwrp2C3UhEBDizZT22I=; b=HqkHV7P2yT4WS3tc0glR6IU1eu
	jjUEVFivK0OwCrCPGEY5vb0nMEnaNzp0e2XNApxDrsLuAl1gB5FQlh1U4s/+9n+l9ZVgcRw07COUR
	aXs/D0fr195WY095L8PzgGgxsbntRHua8cBI/5aIAi6RwXl6304r4LUvuvh2BYT2R0BeKeDdJnDtV
	rV6MIPxzHdBhnaQ8QjhpdE7x4KXs62E3tjH1ExehNlsG/MtWU1aIwToV+zYKnCClLASreFH38Mf7c
	9/v0RBf4zYlfpDVSX9LsqPfJBDql0h1k4j+NHECivogCZWfmEw7BDBxg8H9f69VHI9Q7o5RCOq615
	9vsCkaOw==;
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGgQV-0000000From-3nVv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 17:36:37 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-3a772ec8389so25723801fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 10:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791912994; x=1792517794; darn=lists.infradead.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y3m+IiRPjHXlRcCy5kt0s5eCMwrp2C3UhEBDizZT22I=;
        b=DPqBK/nIh+TrCe/HhnZwRHxTCYXol5XOf61huLd6Zk31ksG8M+rQsGaL2yYhbsExTw
         JwRIglRNZMNEm8jsJBNMSw7eQGdo7yw1CJS9ZsL/nZdCvEzJRfIXHTZ5Fy6Z3ra+/mdq
         pW3N6hbkS+AmpBmnsj9NWSb27ft/kYnWrx5tMgP0lh8SHnB5NwqnK0+yPy1e7Fg9afEo
         ZW9/8k0/3Ly+rVZG5h5lw80QJRuIchJLV3BJSw0uHSQ9FrLfEFeZtUHPtnhrRirpLns3
         RExmuu4dvOtlugc+IzxPm+0vxrhtjtZ0m8PrvMWrWYJ7DEYdez8p7/5IGy4RrsZ5AdNv
         y8XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791912994; x=1792517794;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y3m+IiRPjHXlRcCy5kt0s5eCMwrp2C3UhEBDizZT22I=;
        b=SYUkwqtQoRQ2XkVVepX571a+HoYoXtIzdDPiMczZeXMRA1l0pfnUzGprZbn/30sUdW
         orcORbsoRdNhB/sxyBt7HQ/DqQ0qO6usj2sH4GeVktp8zx6WIrHspPlsHYDSGEzFUcKv
         RASrPz7IYYy/EDYcv0+zTZJQqd2GTTcB7/d+uUoxWwvIo8QimRPepqSkxCKcOj3gyywd
         1yDndHE58Gx2ZLAnFSkxxUMSOGGnx4Qk8kG5767ghdzIQb9XJ8EoR7qvNyQpn5Q59dHb
         3XniVjO3hbw3lZCIKB89yTdQXPT/U+C4jikiiADa/XI4AsX4zmcW+2E9dSjh/EHSvV/F
         worg==
X-Forwarded-Encrypted: i=1; AKwUvBw5Rn8MkzTLtHTGykyk7O6kTqEabOUJ0BKd4YLJCZBB9yBBzny/fJCGXpW0s4GBbmdyjzPH/EerM9s4TI1fuhCH@lists.infradead.org
X-Gm-Message-State: AFq9FYKNF1EFz2CyFpx0aYEuG9u8hV0RhfYzUwMPHwc0VT5JrrrDbxE1
	ma6+s6ofH0+AuyMcqcm368zvbwtIGD2AXd+CpE6llOSNGeFP6/9VPzQy
X-Gm-Gg: AYBFou3vWDEfwF8hgC6WVMz+bBFX5G7KWjJVEsl8MQ49c9Uelahuxa7JiWb/eFfllcB
	bnwTVcHxuhLTIbz2RvnqAtjhzd+CsGOmdhNuxxt22y2wGGbLU219d2LR/B1ZoagKopNlPkQQfWl
	4r6adXYETqAwriVDr+UFWU89vsUvly0Rh5ujc5h91ieZgxLz7IpNzWE/jmf02LEAbTHEX1fI/yu
	7ZaNrajxA7WtBeHVZZEFZXZGmYLrki1gY2TrjcTWENZAvv9UpEVd0QLrFIt/oWgmUzlhBfKieVY
	bimFajh8opaNWqJ7DVj9C51j0izWA4nj3L/65WMaX6Lc6LKMkz5dqHMswmNk/8zA3IYXAlI8D3S
	vpht3Vw1qLt73fJGFlIXB43svLHa/CpV0MrcEJA801ZS1KB4XXDPYOKeXQf28ULes8NGJEb8KBY
	OpCBlJPR89lzXlVfM7K/RJLavYN9mqUA7JoPe36xAtuMtK6z1mNxfw67YoiqykHiIMHBtoIx232
	EFMVHCO29pSxjC06QbnOuAgB75fVOJuCerQKPhhVxQiMg9J30VMoufMHbd9Khjh8kQD
X-Received: by 2002:a2e:a585:0:b0:3a5:f982:9c62 with SMTP id 38308e7fff4ca-3a9c4eb6b77mr31027101fa.1.1791912993414;
        Tue, 13 Oct 2026 10:36:33 -0700 (PDT)
Received: from [127.0.1.1] (ip-024-215.users.dtel.ru. [91.210.24.215])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9c3cf7ffesm36421781fa.41.2026.10.13.10.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 10:36:31 -0700 (PDT)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>,
 Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 00/11] Cortina Systems CS75xx: interrupt controller, GPIO,
 I2C and TWD watchdog
In-Reply-To: <20261013-plastic-dragging-8232efb058ef@spud>
References: <20261012-b4-cs75xx-s2-v1-0-8a7641b7b79c@gmail.com>
 <20261012-dreamlike-hazily-19bb60326f0a@spud>
 <179187542217.3247897.4323160442877168450@gmail.com>
 <20261013-plastic-dragging-8232efb058ef@spud>
Date: Tue, 13 Oct 2026 20:36:28 +0300
Message-ID: <179191298807.12554.2183121269667635269@gmail.com>
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_183636_064194_08B67A11 
X-CRM114-Status: GOOD (  19.53  )
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

On Tue, Oct 13, 2026 at 05:52:36PM +0100, Conor Dooley wrote:
> If things are just tightly packed, that's fine and you don't need to
> make it a syscon. Just because something looks suspect doesn't mean that
> it is actually wrong.
>
> In your shoes, I think what I would do is leave i2c/interrupt
> controller/gpios etc all as independent nodes.
>
> I would however model the pinctrl as a single node, with
> reg = <0xf000001c 0x14>
> I think, rather than 5 instances 0x4 wide.

Thanks, that makes it simple: the interrupt controller, I2C and GPIO
nodes stay as they are, and the pin controller, when it comes, gets one
node for the five mux registers.

I checked the boot loader's pin mux on the board: it leaves the reset
button line and the touchscreen interrupt line muxed to GPIO, so the
dts does not change with the mux register gone from the GPIO binding.

> My take would probably be not sending new versions until at least 48h
> has passed since the last reply on the current version, rather than 48h
> or w/e from time of posting.

Noted. Arnd also asked to wait for the 7.4 merge window to close, so the
next version comes on top of v7.4-rc1.

Thanks,
Fil


