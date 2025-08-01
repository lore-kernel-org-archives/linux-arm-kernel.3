Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91376C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 13:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yQIN+GJox3PRR2AEDjZ0/YWRMM1FlvIBDxZzDOs5vbs=; b=KHtxyk9cN0vRbcFCvVSMgOisXh
	DCpR5TmWYurmOXVrw0hWF1+LOC3flsa120RJ7CMXwJgRrF27QYYADh4UVp9DuRfLDZufrNjwRjA5Z
	moAXdFu/uZ0HFxm7twailYvxj8FSRUdVy9PiAgUoxCkw7FKYNz1yx9MWwv2kIXBRKV1MLCRAuYxNB
	Y8R6OUKf3Fa7KtWzRiryen6WQ++eAMOkdvQ/8LgPHIPuvWVDij0wGT9qbAzTg8qKrckGcljsIpvwr
	RTCkG3ak2zLoUBjrvlCqEG8xeLMNVtHlyOTemPNvhbPJbmOuxJ16t6KP55NcnqK1fRFFHaexOEM5I
	/fvLQXEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhpTk-000000063lz-2t4g;
	Fri, 01 Aug 2025 13:07:20 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhom0-00000005plp-0yhi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 12:22:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754050926;
	bh=yQIN+GJox3PRR2AEDjZ0/YWRMM1FlvIBDxZzDOs5vbs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=QWjdwY3+GTUmpfeaFszOitsj+G/Pttq5r+Ka4+gs6cJEVGt2nt0Z/L5lIpfew4QD6
	 lIGCmAwDEeJ2aThVf2Yv6uZVBXrEClI4hi7pt+6OaYswiQv4PvMjUdG2LjXoDRMcdc
	 u8rtlFMWI1zzSvJ621PQbCyWNQDmADDf64VZma4h0HkTle9vUFVsTHC7ynuGxJ/ylZ
	 VF/DAtQ1fFS9okd3uix2gGC3ZH/F5yap0IZeY2GFuyv8N7/4LqmgL83WhDcw+WQOCk
	 S20arNJiczCI956PIgEkROK/wVslGUZFo0BasCpu8mMs+dOS5qoYmbsIMv2P/1hSLQ
	 chMQwzWUfYYkg==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892f2D600C8F85cf092D4AF51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9048117E0DD7;
	Fri,  1 Aug 2025 14:22:05 +0200 (CEST)
Message-ID: <7b8f2e03cb0f1477e352ac59da638a3cae83623b.camel@collabora.com>
Subject: Re: [PATCH v6 12/24] dt-bindings: media: i2c: max96714: add myself
 as maintainer
From: Julien Massot <julien.massot@collabora.com>
To: Cosmin Tanislav <demonsingur@gmail.com>, Cosmin Tanislav	
 <cosmin.tanislav@analog.com>, Tomi Valkeinen	
 <tomi.valkeinen+renesas@ideasonboard.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Niklas
 =?ISO-8859-1?Q?S=F6derlund?=	 <niklas.soderlund@ragnatech.se>, Sakari Ailus
 <sakari.ailus@linux.intel.com>,  Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org
Date: Fri, 01 Aug 2025 14:22:04 +0200
In-Reply-To: <20250716193111.942217-13-demonsingur@gmail.com>
References: <20250716193111.942217-1-demonsingur@gmail.com>
	 <20250716193111.942217-13-demonsingur@gmail.com>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_052208_450763_9C296DD3 
X-CRM114-Status: UNSURE (   9.02  )
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

On Wed, 2025-07-16 at 22:30 +0300, Cosmin Tanislav wrote:
> Analog Devices is taking responsability for the maintenance of the Maxim
> GMSL2/3 devices.
> Add myself to the maintainers list and to the device tree bindings.
>=20
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
>=20
>=20
Reviewed-by: Julien Massot <julien.massot@collabora.com>

