Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35BEBCD98D2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 08:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2IIKlhb3svN4EPd89ooG0cnVxCK3GU+JlZ80wFVg5BE=; b=0ykR9Sy/bv8JFkiRCDrNKlCIHl
	2mDWkGSyNDjaeoSbNQg/4dh8KGEswbBTT7oSAZxgccrQR4wMGwum5yPa2/MjBn13SbQ3cMLnvPTs9
	tq9a7KO48jc0LoIu6SrdWX1sTFB9H+QS3a2EpztL1cuxardIeYs+MEptPI7Oo2uMof6I61oxcErBR
	RWOe5puPwWya9Vv0zMsVPO9h88JHEDJ5Eq5jLa153oX8Q6L+nZSAWk5uIs33f44Bt/ICJ1st9czs1
	8de0bo/5Ocq5L9XoMcpx3z9MgLWjdY7umxGp51gcwmuIE/dMsSbUC5gA6Eni66b0KjEOpVMWH+3Pg
	/2vT9KCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXb3V-000000092c4-3mNh;
	Thu, 11 Jun 2026 08:46:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXb3U-000000092bw-32Te
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 08:46:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BE5D36001D;
	Thu, 11 Jun 2026 08:46:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4AC41F00893;
	Thu, 11 Jun 2026 08:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781167587;
	bh=2IIKlhb3svN4EPd89ooG0cnVxCK3GU+JlZ80wFVg5BE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=nFQEdgRHCPlaDppgNORMWkZO4wA854yfVwzCTMLEFdNqjtJ7ksYrCCAthGYjPQiGp
	 rpX+y/d8juuDwYat3Rij5nuou/Hbl11diPdFieep+eOn2PNZ2g1rHbJVjnGcKpikwD
	 WyEIv1xUzV0tMHKYIyjEc/T6zO8Z5tSi5tfLRUwMiOhHfXxGl8zQCEh+UFeXkoxh76
	 XNjctmygrPSqtLV9asIrsf0LWuquijaxdu9zAnPg3drK5DTTasjx2Ec4H3OC0bBbQE
	 O0u0wfmfYHMdgxILcA5T3LIglS18amCXgz5SlG5vc25S7WTzNfMw7JEEl6OJpin3ko
	 64l/KQLzvkx0Q==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, ukleinek@kernel.org, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, mcoquelin.stm32@gmail.com, 
 alexandre.torgue@foss.st.com, linusw@kernel.org, 
 Manish Baing <manishbaing2789@gmail.com>
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20260523173251.72540-2-manishbaing2789@gmail.com>
References: <20260523173251.72540-2-manishbaing2789@gmail.com>
Subject: Re: (subset) [PATCH v4 1/2] dt-bindings: mfd: st,stmpe: Add
 missing properties for PWM subnode
Message-Id: <178116758438.933112.378885249487702601.b4-ty@b4>
Date: Thu, 11 Jun 2026 09:46:24 +0100
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

On Sat, 23 May 2026 17:32:50 +0000, Manish Baing wrote:
> The st,stmpe-pwm binding is already covered by the MFD schema in
> Documentation/devicetree/bindings/mfd/st,stmpe.yaml. However, the
> PWM subnode was missing a 'required' properties block. This allowed
> Device Tree nodes to pass validation even if the 'compatible'
> string was omitted. This omission could lead to probe failures
> at runtime.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: mfd: st,stmpe: Add missing properties for PWM subnode
      commit: b07f7904e0523170856876e4412be852377d492a

--
Lee Jones [李琼斯]


