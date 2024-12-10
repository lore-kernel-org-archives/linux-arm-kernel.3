Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52902E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 23:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f8UnOGblbQirPOg8RONWJpR4qniXeIU9augpkXN+BVE=; b=sUA7T2+F54ZKuw78/t2bZJmAnD
	9OkeLDHpxbo1ntnxyVV7ITHa3iQospVCYds2V8xHb/H4iWLDfgBb3QHqRzetpxzSnj31DXVltmz8J
	9IFx+8Qz8tz7dg0El2flP6+osVxRZFVv9z/04rtrhrJbiMyQf8/4xMyeDSL203ZwNhH21R92HRfgD
	A9Z+IgkEBugzZx1Qx80ROcCObRwiU44qY8NLRikiod+X1rCJtE+RJaKp+skNi4QL7ZmB+/HhjkpdI
	PLt6HCKQpBSmjEqCxjwJr3j6q5EBH7RHVooeBSbgWTbifLudCxhK/ItEdgyZ2MlUWrkfbDuoX7Voi
	K1s+GCJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL9ye-0000000DCSN-2Zwl;
	Tue, 10 Dec 2024 23:49:16 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL9xa-0000000DCHL-47Ti;
	Tue, 10 Dec 2024 23:48:12 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-434e91ac3d4so2716965e9.0;
        Tue, 10 Dec 2024 15:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733874489; x=1734479289; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f8UnOGblbQirPOg8RONWJpR4qniXeIU9augpkXN+BVE=;
        b=ALSa18Y03LcvVQXdB5DSH38gp5OYCk8q8//eTl9u5+onRQJVTYUHTIFRR3LZhxuuxp
         NdHmdasgsKxEN0wgijKsh34btalBDP5/fg8f6kQXbUHCCN3jwl/j0MEaWzhZN/iY9rP3
         6SrCX8Ug1iVHkhmmqzfeCDC+F3PuCqXRNn5mDKrjbavZv0TUNk2GKqKIeWO3yhjGvt6Q
         8smif8efjEOd7P/GfmygvVe/nULnamRCHEIb2IElj2bSwFa88/UOsH94Z3ZHhO7O6ygg
         1+ByLR0c2qlkxnps1/tbe1oq/Yt1b9GVoZDZU1XR70uX+uk4iaqzwLJQoWKRkZ8QLBDF
         mmUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733874489; x=1734479289;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f8UnOGblbQirPOg8RONWJpR4qniXeIU9augpkXN+BVE=;
        b=KWWrpfolGoEkuIdKT9NTltKqlFCidpw+KCmWp6E9UOjNhc5pznatJMzzVRvzqul4qz
         SWBQc22VmK2hzXC/TorgF6MTSsEq6/SJ8JnQ9NvNzOlpMTtKM+elR3h+GFL4Vzvv+4UF
         eI5zxpfVuB/ZcyoWl0giNrBNgd7bqim8QtZwU+JFGktp+wfC/LjUIagKYmoUS2y0sRHu
         tEXdq22L2g95fDBC0bFNpuYkmmQwF2zuU2c49g7NuT1YnATUiUGr86DbCoZHtClJJQue
         rP/ghIbsT7r1zH52d7BE1RqlKKRw9AslWyxfm+qDBa6pyBCDkVyAbr0il1rprFr9z/6c
         Q7VQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWXGxHB+vN1vt9GO50ZeYH6eWUFD/LBilQD04ffp/R7oTOWK9aPinrf3i1CTD12j/hJ/opwsEMQhxBjT6j5bS7@lists.infradead.org, AJvYcCVBJI25A6SIrYkLTOhFnbKIwDtj2qPkAocFMOagv0WxSJe3uuOZbPuwqg1a7r6hmu+FzHiP77kVZFBuEzjqoi4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3drr6+rlfYLaWClWRaaO9Vv9z6IP82hU9kdTKl2bA4Pk9+mXu
	2LKcEz9r3w+sYGUnQ2PnV/L/EA+CJFcaAd7L4nmwn7T9Lu277sea
X-Gm-Gg: ASbGncvisHXbXbPGGFgi84R7xhgELgjWMrnqofZu/YMOPMrcAK1bNk+OYPq+RC1f71Q
	7CXdefAbtQuFDlLabNkBQdZb73Fio0E01eDJZPDROYo3TWSJeqYJzIYpsYknXaKe7OZJs5B4vBu
	gkSHoWwxNpbN3Hm7C/qARG5HpVj5a6Tsm+8kk2xKtwRs6d+nnGoTc07m40AX/5iuNvQBwUg/4R2
	VbCHhVir8acD/OD2uxcYbQdQpTWU2hdB6USgsb+GA==
X-Google-Smtp-Source: AGHT+IGVFyqOsHq8vJbKENcE96HqDNgEWPNEGfHZbGGsVdmVNjmlG8KgXuPni26CXmKkrEf6w3YBNQ==
X-Received: by 2002:a05:600c:35c9:b0:436:17f4:9b3d with SMTP id 5b1f17b1804b1-4361c434980mr1530815e9.4.1733874488791;
        Tue, 10 Dec 2024 15:48:08 -0800 (PST)
Received: from skbuf ([86.127.124.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434da0d69dfsm203458605e9.14.2024.12.10.15.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 15:48:07 -0800 (PST)
Date: Wed, 11 Dec 2024 01:48:03 +0200
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
Subject: Re: [net-next PATCH v11 5/9] mfd: an8855: Add support for Airoha
 AN8855 Switch MFD
Message-ID: <20241210234803.pzm7fxrve4dastth@skbuf>
References: <20241209134459.27110-1-ansuelsmth@gmail.com>
 <20241209134459.27110-1-ansuelsmth@gmail.com>
 <20241209134459.27110-6-ansuelsmth@gmail.com>
 <20241209134459.27110-6-ansuelsmth@gmail.com>
 <20241210211529.osgzd54flq646bcr@skbuf>
 <6758c174.050a0220.52a35.06bc@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6758c174.050a0220.52a35.06bc@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_154811_018383_912D502B 
X-CRM114-Status: GOOD (  15.63  )
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

On Tue, Dec 10, 2024 at 11:32:17PM +0100, Christian Marangi wrote:
> Doesn't regmap add lots of overhead tho? Maybe I should really change
> the switch regmap to apply a save/restore logic?
> 
> With an implementation like that current_page is not needed anymore.
> And I feel additional read/write are ok for switch OP.
> 
> On mdio I can use the parent-mdio-bus property to get the bus directly
> without using MFD priv.
> 
> What do you think?

If performance is a relevant factor at all, it will be hard to measure it, other
than with synthetic tests (various mixes of switch and PHY register access).
Though since you mention it, it would be interesting to see a comparison of the
3 arbitration methods. This could probably be all done from the an8855_mfd_probe()
calling context: read a switch register and a PHY register 100K times and see how
long it took, then read 2 switch registers and a PHY register 100K times, then
3 switch registers.... At some point, we should start seeing the penalty of the
page restoration in Andrew's proposal, because that will be done after each switch
register read. Just curious to put it into perspective and see how soon it starts
to make a difference. And this test will also answer the regmap overhead issue.

