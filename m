Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB8FFF94CDB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 07:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rmHi0pt9aJxCrInWowAzuPc8je/meVDoemoTRAoYoUo=; b=nl9kqHh1a9l0kamPpt+Vm0CM5D
	ga/IYWtWbZgzPPQoj0rqLDWny21FYomo50EILAGYVSODP6PBvnErmG99KfhCBRfLqXxthsKqNhTv6
	kE/fT4E8xWbryLL26sPxBcu3mP2pLVmHPzyVUMsO2Uk1P5GxGasqWfMuPiF/lkz0n1WuckSyQxn1B
	AbqQMaHon8TXKmmt5molu5vQS8JqluKm3iAcoNC8KWrs4GpI/kxPHCsQaVWBfAeZfFmgq9ujwA2t/
	kom1PWMFk51/O9m17QVfO16M9KANy4wIOiJkgm11MwlI8Kzhthavz78/Ov4elfrGVlvJnhFOx37r3
	EFYFNEJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFRfR-00000009hWq-3ZGs;
	Wed, 22 Apr 2026 07:06:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFRfP-00000009hWU-1I8h
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 07:06:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EFBD843891;
	Wed, 22 Apr 2026 07:06:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 722D9C2BCB3;
	Wed, 22 Apr 2026 07:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776841593;
	bh=s/4NNvvbT5+1meXDTAtsXuKvs/oS52CCo22GJtQKNQw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K64fVnx16SQRlS4Mz4UJ7/0RCDVkH/6btgMbI7FAh2FQBBjQIUc/OzDaLVpUUm+TA
	 3tw5MUA+1uUN5X4bWep7PIlDZHSL+k4pJWYituxnZAwD4827mfEMsraCHBio9sW3XS
	 dIR9KNbheVIr72lM0z5QzH08K3vwgwenV1vDxru2TT0VU2eG4fuGjlHmB3HAQKxuT7
	 tEfmTQETXL9/EZE07kNovpUQEf1Jy8VXV5YAb+pRyQ8wpqqsMQiry1C5iLTASy5szK
	 JivJ8u0khCIO2nSntYi3XdZZMQ5udZ16c3CkY8AQ5O+y+PwIv02BJm/ihKg7RBL4z3
	 7zbfFXhmzoYyQ==
Date: Wed, 22 Apr 2026 09:06:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stefan =?utf-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Russell King <linux@armlinux.org.uk>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, soc@lists.linux.dev, 
	linux-serial@vger.kernel.org
Subject: Re: [PATCH v5 2/8] dt-bindings: arm: Add zx297520v3 board binding
Message-ID: <20260422-majestic-rabbit-of-jest-c4df6c@quoll>
References: <20260421-send-v5-0-ace038e63515@gmail.com>
 <20260421-send-v5-2-ace038e63515@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260421-send-v5-2-ace038e63515@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_000635_375245_104A1D65 
X-CRM114-Status: UNSURE (   8.51  )
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

On Tue, Apr 21, 2026 at 11:23:10PM +0300, Stefan D=C3=B6singer wrote:
> +maintainers:
> +  - Stefan D=C3=B6singer <stefandoesinger@gmail.com>
> +
> +properties:
> +  $nodename:
> +    const: "/"
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - dlink,dwr932m
> +              - hgsd,r310
> +              - tecno,tr118
> +              - zte,k10

Where are users of these bindings? We do not need unused ABI.

Best regards,
Krzysztof


