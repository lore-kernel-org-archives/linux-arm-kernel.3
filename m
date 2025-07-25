Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D7FC87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 23:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V5uHJsFKtuSwXHNwgmTt6sUi1Ne4Yjfdzv4Tijj/2KI=; b=4EVSdPKHWW5xL6V2AYi3jBLfUa
	jk2M++GeS3b1ot4rUV433BvKHA7iL8p15nYaBuinc2HZOOkwdfRkhODquxVQQ7xGJ8iBMBy1cM7nJ
	TmqTbVaVCOIgXhwgsD76hc9qV4XVMTTyaFuMIK5tiVxzD0Dh6/nBC5SQVAFu8ht3hS5H/QffIcstV
	gXVU6cmVu0PHoS95vIBYgPI53QV/9pWe5wYKplyiBbRtCQ2Ym1kquC2Pyni3NIea6aV+nM15ohfnN
	yKLEzkKsA5MzDKnchgyqtte18FwMGtPqzTffUFDHc5Dgpj+Bw+szEBc4JSs/JtiCoXYod5Ue57eX7
	aQ4qsANA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufRUV-0000000ApMq-3cjS;
	Fri, 25 Jul 2025 23:06:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufRS4-0000000Ap9v-1ja5;
	Fri, 25 Jul 2025 23:03:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C0B2E45240;
	Fri, 25 Jul 2025 23:03:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83281C4CEE7;
	Fri, 25 Jul 2025 23:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753484623;
	bh=JCPGAeq5h3alLBTKg3UQyJ1k3L9zSUxf+6cEhbIJi6s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IPH96wuNxf8STO8NTrMyO6TM9xJIfW7bEcE4GMcrnwbNyfBeUU4ePdJfKUP3yxg39
	 CUx4xPm5vZ0JLbsfraDzNVwDtonzTNA2nZdJOlqjB7eJz4ph5iX6suezAbOFQzrC2G
	 sgYnuhCIeiZmljiW9982uSeQeNE13+gVpFC62hICRChGAyY90ASyN1Vmp80W5yNqGk
	 +uz4SGW2YWye4dwNUAS17iJi8FMiW45/TDAgVMxFcvHg8AuwKNgjLraswk7Y1+93h+
	 l2dGlopP/nErZ6GQKbmNXZaU2gT0H3CUVPhB6fyO9xab8iI+3aoRIoloF7r4D+9IG1
	 jDwp7uq+b47ig==
Date: Fri, 25 Jul 2025 18:03:42 -0500
From: Rob Herring <robh@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org, linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: touchscreen: drop any reference to
 touchscreen.txt
Message-ID: <20250725230342.GA1993803-robh@kernel.org>
References: <20250723071442.3456665-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250723071442.3456665-1-dario.binacchi@amarulasolutions.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_160344_474917_1AC2EA27 
X-CRM114-Status: GOOD (  10.89  )
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

On Wed, Jul 23, 2025 at 09:14:20AM +0200, Dario Binacchi wrote:
> With commit 1d6204e2f51f ("dt-bindings: touchscreen: Add touchscreen
> schema") touchscreen.txt is no longer needed. Remove the file and
> replace every reference to it with the corresponding YAML schema.

The point of what touchscreen.txt says is to not do this. I'd rather see 
time spent on conversions. But you've already done it, so:

Acked-by: Rob Herring (Arm) <robh@kernel.org>

> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---
> 
>  .../devicetree/bindings/input/touchscreen/bu21013.txt  |  2 +-
>  .../devicetree/bindings/input/touchscreen/eeti.txt     |  2 +-
>  .../input/touchscreen/raspberrypi,firmware-ts.txt      | 10 +++++-----
>  .../bindings/input/touchscreen/touchscreen.txt         |  1 -
>  .../devicetree/bindings/input/touchscreen/zet6223.txt  | 10 +++++-----
>  5 files changed, 12 insertions(+), 13 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/input/touchscreen/touchscreen.txt

