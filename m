Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25D04CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 00:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4mifi32Y4CmqV92fjclqI34eh74H7T+Uvngc/78ZCWk=; b=cRvDfYvE5iby13/V93PqbukaMa
	tDJdecpUu7TZqYkTuhP3UuHcQAXpiIAMjQerRjkbRARAqIKGOTf0UjrjZMOI88hXMeam2Krb0z5BA
	CDF15k2B1tKaYQzTaEx8MKmoPA1uRFCJAXB6xBiucHcghT9C5Q4icFyTvZKQ9TA5bvXfFXJzpG2XD
	zMmIB4JJJKbyKUIMQb6LSN7+Pc4OlBfVC1q+loYnyI37Ik/r44LsT3Lx5SJhd/ohEqkdhqzzKgfNg
	g2fWT4t0A94ZF3zdV9YuVHqlcTLLA0JLKjM13sI5OdVxTRZPEAegrSv/STLzmOL6PHVUd9TyRrc8m
	xrmX591Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uosts-0000000FHXu-1E0v;
	Thu, 21 Aug 2025 00:11:28 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoo29-0000000EjQh-24S0;
	Wed, 20 Aug 2025 18:59:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C6B1DA54976;
	Wed, 20 Aug 2025 18:59:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56D89C4CEE7;
	Wed, 20 Aug 2025 18:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755716380;
	bh=x32gr/yLpJxMXpTDEsQjMhHxjK3OW4MpSMneDUDRnRw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FqbgGRuL/dVpoL6ztiYF+OzwJc5i7UOATiLzExhy2eLDS/juGOBrkZrgdHQQgo0Jb
	 MQ0KAomsOhX2NtmpLF3iZkbg3YKNzXHTuvp1of9Lvs8T8QRZowHF0996flMFboDtIB
	 ntiO+ziZ/vF4dwqnasgMT5fF54zSnGUejfh9OQdiT/hguQUw3u7A6rpoeA5TN4OSVu
	 Rh+5xMsf8iwzVXMs4YzKIAosclDzk/1dre3lOTJpZ8ClCj3pUOZBg+87T9jbovGKKe
	 j1j/Hw7I1ERb/ZhmHv1GuAlNXYbdf61wnbqFBqk5opm37as664GrFp5py4xr3VO/UW
	 GJR75zDBDDs9g==
Date: Wed, 20 Aug 2025 13:59:39 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andrea della Porta <andrea.porta@suse.com>
Cc: linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
	linux-rpi-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	mbrugger@suse.com, Phil Elwell <phil@raspberrypi.com>,
	svarbanov@suse.de, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, iivanov@suse.de,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: pinctrl: rp1: Describe groups for RP1 pin
 controller
Message-ID: <175571637912.531450.11432552685148144601.robh@kernel.org>
References: <20250812084639.13442-1-andrea.porta@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250812084639.13442-1-andrea.porta@suse.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_115941_595619_36902B0B 
X-CRM114-Status: UNSURE (   9.98  )
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


On Tue, 12 Aug 2025 10:46:39 +0200, Andrea della Porta wrote:
> The DT binding for RP1 pin controller currently lacks the group
> definitions.
> 
> Add groups enumeration to the schema.
> 
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> ---
>  .../pinctrl/raspberrypi,rp1-gpio.yaml         | 35 ++++++++++++++++++-
>  1 file changed, 34 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


