Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEA0CE77170
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 17:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vjMs6gUjd0BG/RW8WnCIcN/BRNzXbUwn3T+OLY++VM8=; b=zO8rsosa0fLDKarJKR/rBKDzVZ
	cB1Kq+neBgWKgYW9YMxqN6dRKn5mVHqfiHNHZSzuLZdvceandE5qjZ2f8M864lzrahbp28vB3iTv/
	4n7981iom6CZly3rrDHMYozDitujxdJ68TbVjYRCQAGxec8DuplRz/tOgacT1F9ahvgw7Xopjy7ms
	PyAy7ZSheo5sSI+YDY5MI0RwA6dlItPyksSnO0LuULu7OP+a6OiOFvs/LdxgwDTdD3RoD3TX91IF/
	bSOX1lbemBStNQq7rotb6d0s0Qci1PLsAOLxW5fSgIxdNipzuBJxwNNeg8MG12ctio0IFxs905mQ6
	wmJTJmSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJFU8-0000000GuiD-2urt;
	Thu, 05 Dec 2024 17:17:52 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJFJD-0000000GsO8-1OQI;
	Thu, 05 Dec 2024 17:06:36 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-aa625782fb1so15048366b.0;
        Thu, 05 Dec 2024 09:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733418393; x=1734023193; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vjMs6gUjd0BG/RW8WnCIcN/BRNzXbUwn3T+OLY++VM8=;
        b=Fz2GjOwSusQ/NhZR6RaFAidZBdwAdbhoGvx6p22W6P90fz8wyFChyfnslz+dgALpYk
         /uEeSID+Ses8lgKYr0hPyXf3dnjlxLIAiXJGaAp/0pdtIg6PTHdLkPbS9eSuoHgIJTdg
         44rDV6SPttCKLLnefMqQmTQOP9jxqPKg7o2ezmNHTncCQM2Bd/iH0obI/eJUSL/xM58T
         6q3UDoA77JGLGHLHEHsVd86FDwD5M4KnUieFnCeMZy0rNpnoPkEU1mkNy1wSw7kU60eA
         t9n7V35XXwpRJysV+vk68zC+FkjXo8coZipXZVkrRmDd9d6tMIRoMZ1sgsXC9rje3XaA
         dxlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733418393; x=1734023193;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vjMs6gUjd0BG/RW8WnCIcN/BRNzXbUwn3T+OLY++VM8=;
        b=X/PPqYTGYLi5ANoMpI2uMzm3mRDFhZlbgTK6Y9QxvnawWePAVUUee4vPZqPGeKTyJd
         nVhUgyTWh+4ibpa8XQn6fm0vElUp2NFf9OZsL5zKkwZ2O4MjQ36k4sL5CX4ZGOu9D3uN
         BomnxYpwKvN7orooE8gO8Ub7VvfvQbruUa+YK2hnw44vdfrXT+u9Tj2/NUecuIogOFze
         usF7XazEBft+Sq7XlRgIqsXcuIiR0sj4VBaF50hBJwTGBMIknOf508ehckOSmB/FmWtq
         V0PyhVxy8DMM4z5lvpUCk5Vvur44rKlHRAo6x/uw5ufh8gFyP0xkKYaGDzc/E4JWV02L
         QxLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEdQJ1hnA3fLanLnwbJkz1eA9Ufj5r4I+XOGl6o2ovIRR78jElft2cN5tZzLDjSutMn+3covEYVx/IGNebUc8=@lists.infradead.org, AJvYcCWSIKYJarTrIoJKDRwQHugB+uy2UKNEyzZ8E1goPgxfi7MSjkWP7KNCYtZp5F9eY9vxZDzg40Hg88uPQXoJ5Yp0@lists.infradead.org
X-Gm-Message-State: AOJu0Ywhyxf52MmGsWpAhDASSyRno0UmBP6eBauZP4aohLUGpSPxfkXa
	OHHtApbDuh4m/2aHTq4f+fX45pcSzxWHz8qaMlGoFo7yXgIyxr/7
X-Gm-Gg: ASbGncvSn4svasxhaKBusXsWypgKOjYFX3bU0yYkO/UqiFhJRCvs6D32utf7Z21yTVL
	xgQw/J1/06kWW1VeIYIRw5j8QXI5RTVkLiLrvAQHjYh7eZ/LBfVcg86o3QIuMq/7ybEsn0C1J3y
	fBxLWh6k76FXN6mq5ezBKEmnQEq2HGWE4dsb17TnuUGeoE8gmTHh/LfU5WlkrHmmm7GGrIivzJC
	7in9dHOVYvRrbPoTw6p0AVXfsZv2GF+cgGkfdE=
X-Google-Smtp-Source: AGHT+IGVP0gMvyh1uwNQ7wahF1r0luVrywYn93gUAbNzVHLatXVRhr85Yq515hba/uh806NJI4WL+A==
X-Received: by 2002:a17:907:2d8b:b0:a99:f388:6f49 with SMTP id a640c23a62f3a-aa5f7ece4c5mr459441866b.9.1733418393054;
        Thu, 05 Dec 2024 09:06:33 -0800 (PST)
Received: from skbuf ([188.25.135.117])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625e972absm116213166b.70.2024.12.05.09.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 09:06:32 -0800 (PST)
Date: Thu, 5 Dec 2024 19:06:29 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [net-next PATCH v9 3/4] net: dsa: Add Airoha AN8855 5-Port
 Gigabit DSA Switch driver
Message-ID: <20241205170629.ww7qcvgbqdf5ipcj@skbuf>
References: <20241205145142.29278-1-ansuelsmth@gmail.com>
 <20241205145142.29278-4-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241205145142.29278-4-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_090635_367046_5F8507E2 
X-CRM114-Status: UNSURE (   9.17  )
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

On Thu, Dec 05, 2024 at 03:51:33PM +0100, Christian Marangi wrote:
> +	.port_fdb_add = an8855_port_fdb_add,
> +	.port_fdb_del = an8855_port_fdb_del,
> +	.port_fdb_dump = an8855_port_fdb_dump,
> +	.port_mdb_add = an8855_port_mdb_add,
> +	.port_mdb_del = an8855_port_mdb_del,

Please handle the "struct dsa_db" argument of these functions, so that
you can turn on ds->fdb_isolation. It is likely that instead of a single
AN8855_FID_BRIDGED, there needs to be a unique FID allocated for each
VLAN-unaware bridge in order for their FDBs to be isolated from each
other, and so that the same MAC address could live under both bridges.

