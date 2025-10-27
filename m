Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5813ACCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 15:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6/ET+471hNYv512nd52lPnng3Az3u5HXWsjlK/2SSkU=; b=VvoRnX5VOpXUYuor4B0CXWeKoo
	KBVmZh267FBCcME5vhEN1OIdXKFJ+acpc55wq+gvuu+NeDphSpL300nrL7hMMIdmKw4oLjPzVSZCE
	iwxlji0gV6ZmcglfVnVYHSGC2Q35qWwZKw11BK2uKc5CN94JLp5hxjbx2pUlQEaFCo6AVDJ2ewRdG
	Fg3bclnyWppPz8MlPh5ISgoZTUVuu0UoooXb8N6lGVtMLvt3YUncJI0L95fQlCTwTrNj83cQ9p+T1
	Qtzks7+pNtj2L3qpuq/c9Gb7wNvC+l9TKN7tYT60s3+/EWywmZ9r5FoNWd45+O6ImlVQM90QlkFTJ
	/7FL27hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDPKA-0000000EEky-2nxq;
	Mon, 27 Oct 2025 15:39:58 +0000
Received: from mout-p-101.mailbox.org ([2001:67c:2050:0:465::101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDPK7-0000000EEjL-41l4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 15:39:57 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cwHkP0p64z9ssx;
	Mon, 27 Oct 2025 16:39:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761579581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6/ET+471hNYv512nd52lPnng3Az3u5HXWsjlK/2SSkU=;
	b=tam5WpRc+zzWVZV4PbTXOzPSo3dL811nvFxYUwwU/uZDmSL/DXOsQncZ3r2ldGd0sZIYYx
	BLThdTJMrogxTkEJCimnO3hExPdrcoorOr/mSfghdXJ/FBeilKM9xzLMTzstRB4TltLD1A
	z+UNT5uK50CGJJ7bsGCARHVGRPOiULBWIP/FmBpnaJdclKOJ7ksmvqITgk3DNtyST0rcKW
	eOH0CyDJNwimw8PnQcrOSAGzlf6g0qDrLgnJw7f4wr3cVCiZPLUl+eIMTlhyssOZ6AyhUc
	2nJZRHrWOpMQ6pqApTB2D+bG2JrfC5lBcRe6KhsUDhGrchpniBFyjWJkRagZhQ==
Message-ID: <86de57c6-94e9-43b7-8e6a-d301ce73b0ba@mailbox.org>
Date: Mon, 27 Oct 2025 16:39:33 +0100
MIME-Version: 1.0
Subject: Re: [PATCH v3 1/3] dt-bindings: gpu: img,powervr-rogue: Document
 GX6250 GPU in Renesas R-Car M3-W/M3-W+
To: Matt Coster <Matt.Coster@imgtec.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, Adam Ford
 <aford173@gmail.com>, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Frank Binns <Frank.Binns@imgtec.com>,
 Alessio Belle <Alessio.Belle@imgtec.com>,
 Alexandru Dadu <Alexandru.Dadu@imgtec.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Magnus Damm <magnus.damm@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
References: <20251022033847.471106-1-marek.vasut+renesas@mailbox.org>
 <6bc264c2-0c1c-492b-ba58-8c7609cfc565@imgtec.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <6bc264c2-0c1c-492b-ba58-8c7609cfc565@imgtec.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 0afc5b27525a69b226e
X-MBO-RS-META: dd664fa9dm8z1eoh4j8a8wtz7xqgzsi8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_083956_132594_403C8792 
X-CRM114-Status: UNSURE (   7.77  )
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

On 10/27/25 3:08 PM, Matt Coster wrote:
> Hi Marek,

Hello Matt,

> Apologies for the delayed response, I was on holiday for the rest of
> last week – I'll apply this to drm-misc-next now.
No worries. Thank you for your help !

