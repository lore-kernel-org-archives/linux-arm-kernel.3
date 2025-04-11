Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A343C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 12:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LrZdh+poEHqluBAWamb9c0Us0R4xYVMIWRYTWI8yWC8=; b=ykLjskV3x6vV2+Z5EmOD2HrZIq
	KnQHVw4HA46Mx13QD4g1yaw3XkidgDDIE6Z9TU+FiGoWKRjGZ8t9P9PCvJEYkHozw8vy+7HHfX2Xl
	EtXC44u9QwOliYNaM2mdNsoIC43N04NUW7SbvLUbpVpRS0Wis55jP17cLjEmrdUolM4NimFbt4FmM
	0qux+Dl05voh4g0XxHGuRuMLP7MxfydpshBJEHMV++OSi95GgUdAv45eEIdLvZlaCcpJMdyI/7LOd
	b1X4+5VUs0u//peSTP7FB/De9fp8vxMNHZDNHmAcXvt6CdR38HF+5bJC5XD9hG6cPEY6i6x6NHW2L
	kgJ20C/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3DVE-0000000DkCX-0y48;
	Fri, 11 Apr 2025 12:29:00 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3DTD-0000000DjlU-1CLQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 12:26:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=LrZdh+poEHqluBAWamb9c0Us0R4xYVMIWRYTWI8yWC8=; b=GfYPvYj2YpuY0FakqwJ18AYy7Z
	l4P32HJxETjyHv46jdNXZCQJDOBqgncPzVTO2KRwdRLjW5EyLg+GM5QcoZ0fgXp7tz7wm6m3wJNOW
	SSQTyOA/X10oRju+vgTz3UZcDRgWhYyneNcw/fVOMgg2yIoKpxan6kXEwkuBtfoBpad4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1u3DT2-008nvb-JC; Fri, 11 Apr 2025 14:26:44 +0200
Date: Fri, 11 Apr 2025 14:26:44 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, rogerq@kernel.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	srk@ti.com
Subject: Re: [PATCH net-next 1/2] dt-bindings: net: ethernet-controller: add
 5000M speed to fixed-link
Message-ID: <8aea379f-836c-4402-8781-ac7ae26c3529@lunn.ch>
References: <20250411060917.633769-1-s-vadapalli@ti.com>
 <20250411060917.633769-2-s-vadapalli@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250411060917.633769-2-s-vadapalli@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_052655_320713_F8904E13 
X-CRM114-Status: UNSURE (   7.26  )
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

On Fri, Apr 11, 2025 at 11:39:16AM +0530, Siddharth Vadapalli wrote:
> A link speed of 5000 Mbps is a valid speed for a fixed-link mode of
> operation. Hence, update the bindings to include the same.

Yes, O.K. Technically any speed is valid for phylink fixed speed. You
could just as well say its a 42Mbps link. But keeping with the speeds
actually defined in 802.3 makes sense.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

