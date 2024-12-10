Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8ACEE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 20:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WudyUJe63c8JFxkj8fmVFDLqePx04Jr1Dyl2u8hD8a0=; b=e+oUplke1s+rZYphVaAjfEZPts
	C4oTnd4WYOSXC60Hxd/YnhpDJqonLR5rp8vLQGr+TdJEnWTkH1gMbn7Xs97VVOjKw67gverh6hcZg
	5gNUltES9WHy1YX1c6FEBd1lzUIjTVGaR67txPpYuRA/slBgP5X7ngNnXrXQWlKsQadw3YKa7gkfu
	3tLgZMV2jpMjb1KEWRoQOlXdsIt79fr9/UnlBpvLLwPnUdELaqArwaVUGqeGLjooqtjEcZ793ZW7I
	V7pHEiyH/GU9O7/cuL70CAnshmwOx0kFlA6Uw0Tzm+lQkAHXj2cEe4Ibd7HFsfhtx1u1nQqao0855
	PwggAaMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL6kH-0000000CfBb-474r;
	Tue, 10 Dec 2024 20:22:13 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL6j9-0000000CewF-2tLa;
	Tue, 10 Dec 2024 20:21:08 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-aa67bc91f88so57703866b.0;
        Tue, 10 Dec 2024 12:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733862061; x=1734466861; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WudyUJe63c8JFxkj8fmVFDLqePx04Jr1Dyl2u8hD8a0=;
        b=XQQWYQYuDnamXkyrkRY+zm7krWWrA1S2Vq0OPZHrZ2dnXihKx3SIvQ/sx7IEt3ogtS
         3PjxBeNH/Rg9q/lTk8n7Mkf27IGGuvjISbVgPNWJw2jn2OTDOFxUeo3msshSg9DwNuNj
         0wWvkg9HfLvSLHmtUrWrL9NG6VqZW6QBLWaScvmZMqn9Fr/wR3s1nzjTkDNK5cweBKnQ
         +Qulq0xfUzquU62EARfUmgNhmWgmNz0Z3uGBqjyPiUzg0dHoCx9vJE1564bEqvOe7gdH
         5lMwGxARYQc8x57PezXgU8/oFa+PRAajPbnW5B2ZRZhf1pKs4sgKieegis80OsiOaYC6
         c8AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733862061; x=1734466861;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WudyUJe63c8JFxkj8fmVFDLqePx04Jr1Dyl2u8hD8a0=;
        b=xRcAE/fFJaQk1OLZ1Y06zS3Gdjff0DQekGKmLmmbG13lklcNc4OBHP1Y6XkENtl4Y8
         o4fOD95n0XatQ9nhQKNiVltTLJ3xVKqiPETAENKc0Ba4nAZrrRWfCki7zpykUks1uesj
         /TNyKpesnX3tsI8AA5riuTjudwVxifVOHL2OIYNyauHloeggmAfzDNbLmM0hfTjHch9v
         CfiVx5TA4eGaBz4x+uLN3b8LbA47V3Ve6Cn+Wze7gitvcrmomo2rFd1Gn/U35LUSznR9
         nd5Ml0m9iA8eEnP9Bs8Um2LPrauU68ZCbjtvu8RdF0t7UDB+7PAxrcb7iKMQw04lWFlL
         afzg==
X-Forwarded-Encrypted: i=1; AJvYcCWEuL4oj+achiblznEyI8J7OHneENY1mAPFhD4DU5vtw+fZzB4Av/6H+a89d5zXvmVi0DYQFcsD90F8KyV9ZFi5@lists.infradead.org, AJvYcCWISLtzhmjrojd4dkvTw8t3c1VwD0Boz4cbe2Q4g0F7R1voYJBvBlPWE3qqUhhuZomxvK0UwBR/RUOU9pXx/iA=@lists.infradead.org
X-Gm-Message-State: AOJu0YxiCrj8wKggsk7wCrbgkhwT8MCFsmDwhFdZqZIev6rEosiJmehb
	SVN2nIO4TMHNH4D+V+m/G3mIJvp5P0JC2NnT50BEa/EXhi1Rzhrs
X-Gm-Gg: ASbGncvko5kHuWhiaCiNFZjeLWVW4ciXWzzcw8T8nDQPn42VcbFDCQK5dFBH08z43Qb
	t1oNmMS3vEI5cDD06SBh1rUVDh8u3PD6VVcIUlmRwzjUTTQG0Cee00WpdL2FaX4j/IwfZ/5pP8U
	tPjByN8hlXfS+ruI3/72mEJksmN6Lp1bYPzRASCTIa7xT+D7vgPCHjrsbd2opeBfEWeP1iLc2yA
	TIgI/5WLcz7RghDWfVe20dw51EwL/GSjZ1XIMDkyw==
X-Google-Smtp-Source: AGHT+IGjcxHC/a2dd358/yErtbhd4ej5DXUjk12poPR/JpWsRTPDUnrfaJH4uV6DTzTNXMcURT/RxA==
X-Received: by 2002:a17:907:1ca7:b0:aa6:9407:34d3 with SMTP id a640c23a62f3a-aa6b133c966mr3485266b.9.1733862061023;
        Tue, 10 Dec 2024 12:21:01 -0800 (PST)
Received: from skbuf ([86.127.124.81])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6696acc74sm540561666b.134.2024.12.10.12.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 12:21:00 -0800 (PST)
Date: Tue, 10 Dec 2024 22:20:57 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [net-next PATCH v11 0/9] net: dsa: Add Airoha AN8855 support
Message-ID: <20241210202057.x2tds77popzdcak6@skbuf>
References: <20241209134459.27110-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241209134459.27110-1-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_122103_728136_F854F8CF 
X-CRM114-Status: GOOD (  14.39  )
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

On Mon, Dec 09, 2024 at 02:44:17PM +0100, Christian Marangi wrote:
> TEST: lan2: 1588v2 over IPv4, Sync                                  [FAIL]
>         reception failed
> TEST: lan2: 1588v2 over IPv4, Follow-Up                             [FAIL]
>         reception failed
> TEST: lan2: 1588v2 over IPv4, Peer Delay Request                    [FAIL]
>         reception failed
> TEST: lan2: 1588v2 over IPv6, Sync                                  [FAIL]
>         reception failed
> TEST: lan2: 1588v2 over IPv6, Follow-Up                             [FAIL]
>         reception failed
> TEST: lan2: 1588v2 over IPv6, Peer Delay Request                    [FAIL]
>         reception failed
> TEST: VLAN upper: 1588v2 over L2 transport, Follow-Up               [FAIL]
>         reception failed
> TEST: VLAN upper: 1588v2 over IPv4, Sync                            [FAIL]
>         reception failed
> ;TEST: VLAN upper: 1588v2 over IPv4, Follow-Up                       [FAIL]
>         reception failed
> TEST: VLAN upper: 1588v2 over IPv4, Peer Delay Request              [FAIL]
>         reception failed
> TEST: VLAN upper: 1588v2 over IPv6, Sync                            [FAIL]
>         reception failed
> TEST: VLAN upper: 1588v2 over IPv6, Follow-Up                       [FAIL]
>         reception failed
> TEST: VLAN upper: 1588v2 over IPv6, Peer Delay Request              [FAIL]
>         reception failed
> TEST: VLAN over vlan_filtering=0 bridged port: 1588v2 over IPv4, Sync   [FAIL]
>         reception failed
> TEST: VLAN over vlan_filtering=0 bridged port: 1588v2 over IPv4, Follow-Up   [FAIL]
>         reception failed
> TEST: VLAN over vlan_filtering=0 bridged port: 1588v2 over IPv4, Peer Delay Request   [FAIL]
>         reception failed
> TEST: VLAN over vlan_filtering=0 bridged port: 1588v2 over IPv6, Sync   [FAIL]
>         reception failed
> TEST: VLAN over vlan_filtering=0 bridged port: 1588v2 over IPv6, Follow-Up   [FAIL]
>         reception failed
> TEST: VLAN over vlan_filtering=0 bridged port: 1588v2 over IPv6, Peer Delay Request   [FAIL]
>         reception failed
> TEST: VLAN over vlan_filtering=1 bridged port: 1588v2 over IPv4, Sync   [FAIL]
>         reception failed
> TEST: VLAN over vlan_filtering=1 bridged port: 1588v2 over IPv4, Follow-Up   [FAIL]
>         reception failed
> TEST: VLAN over vlan_filtering=1 bridged port: 1588v2 over IPv4, Peer Delay Request   [FAIL]
>         reception failed
> TEST: VLAN over vlan_filtering=1 bridged port: 1588v2 over IPv6, Sync   [FAIL]
>         reception failed
> TEST: VLAN over vlan_filtering=1 bridged port: 1588v2 over IPv6, Follow-Up   [FAIL]
>         reception failed
> TEST: VLAN over vlan_filtering=1 bridged port: 1588v2 over IPv6, Peer Delay Request   [FAIL]
>         reception failed

Why do these fail? They are dropped on transmit? Could you see with
ethtool -S where they are dropped? (DSA conduit, CPU port or user port)

> TEST: VLAN over vlan_filtering=1 bridged port: Unicast IPv4 to unknown MAC address   [FAIL]
>         reception succeeded, but should have failed
> TEST: VLAN over vlan_filtering=1 bridged port: Unicast IPv4 to unknown MAC address, allmulti   [FAIL]
>         reception succeeded, but should have failed

It is unexpected that these fail. The vlan_over_bridged_port() selftest
sets has_unicast_flt to true or false, depending on whether the driver
declares IFF_UNICAST_FLT, and depending on that, sets the expectation on
whether unknown packets should be received.

There may be a bug in the selftest, but I doubt it.

I haven't looked at the patches yet, but from this behavior, it looks
like you mechanically satisfied the requirements of dsa_switch_supports_uc_filtering()
such that DSA will set IFF_UNICAST_FLT, but host addresses aren't
actually correctly handled, or CPU flooding isn't turned off when it
should (ds->ops->port_set_host_flood?).

> TEST: FDB entry in PVID for VLAN-tagged with other TPID             [FAIL]
>         FDB entry was not learned when it should
> TEST: Reception of VLAN with other TPID as untagged                 [FAIL]
>         Packet was not forwarded when it should
> TEST: Reception of VLAN with other TPID as untagged (no PVID)       [FAIL]
>         Packet was forwarded when should not

We discussed off-list about this, a special configuration needs to exist
to consider as VLAN-tagged only those packets with TPID == bridge vlan_protocol
(i.e. 802.1Q).

