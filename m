Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57063CC6B39
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 15:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HVw7Nmm0VW1a3sl5XHyrI6+aoyrs2z1eR25B+WaHeQs=; b=tewURz5pVBUoPKjcyHc9N7gNzh
	nLETDINWf2TXLAsysCfBUdkm3XZSvE1G4gFWWnydgkMlTIeoYAqBXAwc32BZ/WAG1DWU0lxJf+FTh
	CwTn5m+iM849BjVrBOsDeRVvEaNlQM0kMJs5CG0EJqIxhzppQSm/5XmNYAKEKqAb6/g1f9R0eF8wC
	ClpgWC2+N1rUuyEl/Hp75OQYcjZz9PxEROhXX1kC5GlB79rtzj/OwbTUVfByU3nwCkkQCwDzVewsR
	YHuCUX+0hzYdkekHQ+/kzyPWfPLK4n2xJ/PydBxHKVWOxfmkoLZdJUfaGdDy426+jVrmxBY6bCdFr
	KWgEazJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHNlX-00000000csg-2Lny;
	Thu, 15 Oct 2026 15:53:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHNlU-00000000cs9-3JNI;
	Thu, 15 Oct 2026 15:53:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3FC2A601EF;
	Thu, 15 Oct 2026 15:53:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EBF71F000C4;
	Thu, 15 Oct 2026 15:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792079588;
	bh=HVw7Nmm0VW1a3sl5XHyrI6+aoyrs2z1eR25B+WaHeQs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=cM9FQrU6LiVZexQnyD/RSRu/KEyxBDWORjo59+NoyN8ppIcaspjtF4wM9B/Qim4KS
	 8RDAfqeWp/ny0IWEr/T8IFYtrtW79Z8LLJYRYp2mjBlSvN8keOUMRFcIedplYrLCzE
	 ULc3tQSh/G85xDz8ysCHEx1NSL7eUJKCcUKMMANfIre0SU6o6RJglPA9eRAM8hdjQ/
	 m1EJzFZmHyz1gL5iSll/M8IOBIlunQKplebkdLxWMU7SU6EUfFpJFWY9hauO6cXrVL
	 h1FMql5Lz5fALhNwjqpOJA/54uJNApzN3Rogs2h6lUF39hk+VT0zPeGPgj+M1t8ZfN
	 camhYwBdkU0jg==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Quchaosheng <quchaosheng000406@163.com>
Cc: Chris Zhong <zyw@rock-chips.com>, Zhang Qing <zhangqing@rock-chips.com>, 
 mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260923083001.606935-1-quchaosheng000406@163.com>
References: <20260923083001.606935-1-quchaosheng000406@163.com>
Subject: Re: (subset) [PATCH v5] dt-bindings: mfd: rockchip,rk805: Convert
 pinctrl to DT schema
Message-Id: <179207958534.2076854.17430709456309504242.b4-ty@b4>
Date: Thu, 15 Oct 2026 16:53:05 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
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

On Wed, 23 Sep 2026 16:30:01 +0800, Quchaosheng wrote:
> pinctrl-rk805.txt describes the pinmux controller that is part of the
> Rockchip RK805 PMIC. The PMIC itself is already described by
> rockchip,rk805.yaml, so the pinmux part belongs there as well: the
> pinctrl node is a child of the PMIC node, not a separate device.
> 
> Fold the pinmux description into rockchip,rk805.yaml and drop the
> standalone text binding.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: mfd: rockchip,rk805: Convert pinctrl to DT schema
      commit: c2f8288a58e22feeeb9c444bbaff179b0058e459

--
Lee Jones [李琼斯]


