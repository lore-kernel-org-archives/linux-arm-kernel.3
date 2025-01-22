Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1021C02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 08:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mkqSOaATYfyEB/9ytm85E9ZhI6rECw2BTu5EZhwNsOo=; b=4oNh3vsO9Ovbh/42iUZll0+YZt
	AB1keIGw83YTpu4vyxsRqIpGsc43/de6YFtKpwE+4iiXHtsMRQEnUsaGE21KqDDObhfx14rWKWZeR
	+x0B/DKYbztoOqprKYsQsm5BE2+bWbJfn6goNdtsWIcJAfYOFqOJQUc0HV8EckbdZJ49aexHdbGmJ
	d+2Ej4CTr4ydIZz3rU/bK0zT3YVs+La+Lxq7fxYWI9JlaEiCSLqkRPvpmq4DpUfJ8ZRibQ7/6+9Ot
	3jbh1CAH9Y3rXU3jZDZ6SmLlRYbdNMmxM6nc0IX9eyUGIs0We1qi4qP6NsJFCISvZRqPcw9GK3xEp
	I2r/80Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taVjZ-00000009fLi-0SHV;
	Wed, 22 Jan 2025 08:05:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taVhZ-00000009f0s-0HHr;
	Wed, 22 Jan 2025 08:03:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 29DA95C5CC9;
	Wed, 22 Jan 2025 08:02:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C0B8C4CED6;
	Wed, 22 Jan 2025 08:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737532984;
	bh=qlsDdKWp9jAbvCWbUO/DPo1L2HYoPRwKgJ/Bbi2jIR4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oThRLHS4vLztbbjbOriHl28d4JcYTO8ZGi7nmsXpqSUtuzv0xbC1aFXSpXMWzJPg/
	 XkRAfiVRL883V5BtB6IGuWrd4hTjSCDSVuMWXJHt+2Ax10hZe8qMTrwjl7M5nXOHCO
	 vAP23gmZystHtP+gamPud13XJmH+fdEHgRhOtg8UytMVVWAlrqXFqEZYSZPwZhGUV2
	 4vcxpgrPDeEd9Lw0zXyX+Bwxhri01QUux8oZYufw+htLqkfmcr1se5BsZJSrVJOTP0
	 aIWOl1bWwTIMtztBYnK5qSTSaLFQe9MJU5on92EcXPYmjI1YxrnTsyIFxYW6L9n4Cv
	 14hPBK9gsBRAw==
Date: Wed, 22 Jan 2025 09:03:00 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, hjc@rock-chips.com, krzk+dt@kernel.org, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	derek.foreman@collabora.com, detlev.casanova@collabora.com, daniel@fooishbar.org, 
	robh@kernel.org, sebastian.reichel@collabora.com, 
	Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v12 11/13] dt-bindings: display: vop2: Add missing
 rockchip,grf propertie for rk3566/8
Message-ID: <20250122-quaint-heavenly-herring-c92c32@krzk-bin>
References: <20250121103254.2528004-1-andyshrk@163.com>
 <20250121103446.2528212-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250121103446.2528212-1-andyshrk@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_000305_150722_6BF047BB 
X-CRM114-Status: UNSURE (   7.11  )
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

On Tue, Jan 21, 2025 at 06:34:44PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> Propertie "rockchip,grf" is required for rk3566/8.

Fix typos.

Why? What we see from the diff...

Best regards,
Krzysztof


