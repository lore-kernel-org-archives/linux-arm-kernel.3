Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB339C02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 15:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oe749KfJTlBXfu5CFXqHM08pOCrnuopnGGzvAlfhP8M=; b=EKD9cCMuQOZe+3Y5cQ1q2J9Rpj
	gMYYlfM//umXtGI2E5eGdPZuq+8Yh0PB6NtEFTMUifs8jxUoY8+S9l3UP7371TbgolaO5+7hSwYWC
	DkKJ4x5oWPye7CH4jIs4nhUZdNU3ckuva2UkgiWtMFMBoEGzNzy3BLSu6n5yiL9bnXhkl8lDHrNpq
	O3e2Dl589qM+4av13mkzewi/02p3x1WI70vdC3+5wzA1wRIBZ66/qOUNnJEwoBYBPmtyxCWOSesQu
	uj+0x+LeqkKdz2mx8Gk0go7Opc3Iw5eylxqJsKByyPRGYnRRuCmA3f+U2/mddfqQ+hsY03x316p1N
	2EyUHrCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgPvc-0000000A0F7-2Ddb;
	Fri, 07 Feb 2025 15:06:00 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgPtV-00000009zmZ-1tJP;
	Fri, 07 Feb 2025 15:03:50 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-ab7922f8510so6256966b.0;
        Fri, 07 Feb 2025 07:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738940627; x=1739545427; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oe749KfJTlBXfu5CFXqHM08pOCrnuopnGGzvAlfhP8M=;
        b=mU/scucZFUFp1vPcnCNTjluoOLh+AOnFmgPCYS3W07tkyzwTEz/vaystRbKJrJOuN6
         S4VwTX+nJBMfVMSvluxld4I5fNGwW54/WwWmTLln+vNywLn58QeJT32R68TeHIcZ5ZGu
         s4HmDT/qa3ppTkuas76dC7qZYsdYyPT0UVemGtNiF3CkIK65kgacMYsi4Y5i0AOnCBoK
         dJX8yxRLXhqkMymB+BmOW8OXsvgD4c/2Fxopt2KClmgUWaTwUkX4iN4B4b3BBcqAFuLE
         kGT8qGI3Ugh7pCnISJ6dS/6E1zvcUwxD2Kc/qFpfsbvgDP3eOQ9N1EoY46Rs54hJEncs
         2zhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738940627; x=1739545427;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oe749KfJTlBXfu5CFXqHM08pOCrnuopnGGzvAlfhP8M=;
        b=BNhtVwJA4d95q+dIv9Yve5Q45hmP9cwCTdX5eQtVvukbV4nJ6Oo4277gcVxAukENH7
         a6OkSYa2entwrD8gO74IMtVnyBH6FUDBXx3BH1rVW06Re5mRVZ21H+Prx3HsJffAenTq
         4cgUN+gqtQhenkz7Xu49sPVVpv5VBn58YXZLVBn0tH+BF6Zccm7cETSAlkQDKuQJ8KJW
         g1f1ozhSARiuufNG1MEcA/Zj0+ThZEbVLLxIZG4RglkvWu4A+GXnajk8ZzRdEiiXkNef
         ixI2rJ6y3s5UdtmTnwh+G3bBbXLT2GjzJtORMApT0jpRTc9Pc+eyjDdl0sVskzx1TqdH
         BCqA==
X-Forwarded-Encrypted: i=1; AJvYcCUuB2m/Zx2k+hA83xPdLxcqjxKx2C2thQcwpShCXPZrXu+muJkl2g0P4zYX+SXr+iUUoKCKX7RBI7944fYUw6ar@lists.infradead.org, AJvYcCVnlX4M5jkztE9iicXejffLG5uduRU/KK58vOzSdFFxDisQnZwtjzlQBZj0N+dmHvdyhkW0+537bqLFsW3fkok=@lists.infradead.org
X-Gm-Message-State: AOJu0YyuRMlVV/+jToRzceXEmRLbkPi3xbykSUQMdMv6ZSnTCCqravnL
	9Y/1EBmfSfPRWyaMk/bM84/s25tMvW/Zc9c9Lx8D/yywHryq4K2r
X-Gm-Gg: ASbGnctvTNMX5lSQ7J85voNGq3w+CmhaTEu1uBixaI3pvilWaJSIS6b8iZ9z1Cl4vZZ
	7lx4fHadmJqP03aTWrnmMAtpBaHBbH37IgPkWCOX2rFknjsEafBI2yTKrY4flxWD09DGKAXkLsV
	xKOobwqpER2d5m2hy9UER51ROrvPJ5Eeo2rMnZIsUi2HDqevMUhLRVeM7jq+sMmu6c/ulitZ9Cm
	3H5GXw28ee4DDvj2yP2q2tV9J5sWCIC8qRKN+MXUGEJ7Yem678HL/SWQGdgoVHYUvQOSntjibzx
	2IQ=
X-Google-Smtp-Source: AGHT+IHsKZDrEgjFzsjOHb6AegH/WyuF+q13HWJO6Xd2xBaxIXrpB2eiffrWM2ZlqpgeNqo0xDb4cA==
X-Received: by 2002:a17:907:360d:b0:ab6:ed8a:1593 with SMTP id a640c23a62f3a-ab789b6045amr110408366b.7.1738940625225;
        Fri, 07 Feb 2025 07:03:45 -0800 (PST)
Received: from skbuf ([86.127.124.81])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7732e6192sm278238266b.121.2025.02.07.07.03.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 07:03:44 -0800 (PST)
Date: Fri, 7 Feb 2025 17:03:40 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Eric Woudstra <ericwouds@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Jozsef Kadlecsik <kadlec@netfilter.org>,
	Jiri Pirko <jiri@resnulli.us>, Ivan Vecera <ivecera@redhat.com>,
	Roopa Prabhu <roopa@nvidia.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Kuniyuki Iwashima <kuniyu@amazon.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Joe Damato <jdamato@fastly.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Frank Wunderlich <frank-w@public-files.de>,
	Daniel Golle <daniel@makrotopia.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org, bridge@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v5 net-next 12/14] bridge: No DEV_PATH_BR_VLAN_UNTAG_HW
 for dsa foreign
Message-ID: <20250207150340.sxhsva7qz7bb7qjd@skbuf>
References: <20250204194921.46692-1-ericwouds@gmail.com>
 <20250204194921.46692-13-ericwouds@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204194921.46692-13-ericwouds@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_070349_488624_424AEBD9 
X-CRM114-Status: GOOD (  18.22  )
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

On Tue, Feb 04, 2025 at 08:49:19PM +0100, Eric Woudstra wrote:
> In network setup as below:
> 
>              fastpath bypass
>  .----------------------------------------.
> /                                          \
> |                        IP - forwarding    |
> |                       /                \  v
> |                      /                  wan ...
> |                     /
> |                     |
> |                     |
> |                   brlan.1
> |                     |
> |    +-------------------------------+
> |    |           vlan 1              |
> |    |                               |
> |    |     brlan (vlan-filtering)    |
> |    |               +---------------+
> |    |               |  DSA-SWITCH   |
> |    |    vlan 1     |               |
> |    |      to       |               |
> |    |   untagged    1     vlan 1    |
> |    +---------------+---------------+
> .         /                   \
>  ----->wlan1                 lan0
>        .                       .
>        .                       ^
>        ^                     vlan 1 tagged packets
>      untagged packets
> 
> br_vlan_fill_forward_path_mode() sets DEV_PATH_BR_VLAN_UNTAG_HW when
> filling in from brlan.1 towards wlan1. But it should be set to
> DEV_PATH_BR_VLAN_UNTAG in this case. Using BR_VLFLAG_ADDED_BY_SWITCHDEV
> is not correct. The dsa switchdev adds it as a foreign port.
> 
> The same problem for all foreignly added dsa vlans on the bridge.
> 
> First add the vlan, trying only native devices.
> If this fails, we know this may be a vlan from a foreign device.
> 
> Use BR_VLFLAG_TAGGING_BY_SWITCHDEV to make sure DEV_PATH_BR_VLAN_UNTAG_HW
> is set only when there if no foreign device involved.
> 
> Signed-off-by: Eric Woudstra <ericwouds@gmail.com>
> ---

Shouldn't mlxsw_sp_switchdev_vxlan_vlans_add() also respect the
SWITCHDEV_F_NO_FOREIGN flag? My (maybe incorrect) understanding of
bridging topologies with vxlan and mlxsw is that they are neighbor
bridge ports, and mlxsw doesn't (seem to) call
switchdev_bridge_port_offload() for the vxlan bridge port. This
technically makes vxlan a foreign bridge port to mlxsw, so it should
skip reacting on VLAN switchdev objects when that flag is set, just
for uniform behavior across the board.

(your patch repeats the notifier without the SWITCHDEV_F_NO_FOREIGN
flag anyway, so it only matters for flowtable offload).

