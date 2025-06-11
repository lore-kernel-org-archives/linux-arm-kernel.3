Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6997C71136
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 19:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pKsYBtZSzJFBNl3Ug9YmBQ3IUiKtUuYSnIdF26bHabc=; b=PiM5g+sLVxca7FBFWEsLMQvkaL
	ZkCPa7hXhkqJsoyndeRvVOKW7kwc0J8uBZomfoMSoFeN9TyxFYIyAkdmqOSucWe7YU/ZqIQjY51NN
	yGAaAsovtVq5l95Ajwk7TZnj9laGfJQFl7OMP0FVcZ4AVU6D8meyxq7n8+sYLKGWB8a7AmlnqcUu7
	jNTKQ4IOYs9BQm8SiWLoG4+x6rczINuza3OC21Tl3dFFP6TFsHhUoE3EHX2GviaM0luV/yL/q4NoB
	xV5cvsVWDLurEycNjuapMiKv6TFr319K0DDv7wuVkdmmgn6v8uaAOonRb6NPy0mrxlZitriDIu01/
	BtLh7rpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPRZ0-0000000B59q-2obP;
	Wed, 11 Jun 2025 19:56:46 +0000
Received: from mail.alien8.de ([2a01:4f9:3051:3f93::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPOVA-0000000Adhv-2FHJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 16:40:39 +0000
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id CBBC140E0184;
	Wed, 11 Jun 2025 16:40:21 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HV_N0c_jC9Zt; Wed, 11 Jun 2025 16:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1749660018; bh=pKsYBtZSzJFBNl3Ug9YmBQ3IUiKtUuYSnIdF26bHabc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=irpbFja7+nN5gvyS2dBJNnfdQwL4IoXZgjiKGGLCkJcpE9TxYIL5z0b7+08iJ7eyj
	 U/RY7VNhGdx5pEbgv83Wezoniq6njA4/lg0ZSoOHGDjSc7MdQrhO3WeyfKZ95X5ccn
	 ay2GHcf1IybVIuITZX35HLf8vBgYP9x5QkM9B/qTc7P9w9lq5d+UdzSDDsaRd6qkWR
	 Dmsl/UeBkNbK7TEO1moiiINyst5slk/xHu795Qimo36MVG9yhyJ1heQ74GKT5zv05a
	 Bl7GlviUC46ps3U+hTIJY+MUExTzg/3W1w3OGeSaqUc4ydckQNyfBgEE9DfXGLSSYM
	 LNRks5cZ8S0mO8zFqGvWvTB7X/tfcX1/qDPCgidj1tauZ9IYYsfyYZepMJ6E1YzjNp
	 E7d4iHuJSct9d7X91541CGB3xc74edzbKBcNRj/i3m8pDUSdcQ8u85MtPuxjB9cv/3
	 g6ve3DI33PAcKME41rVwxCexyfANfY/yJD/J2E8zEDXxieV9l+Y5zpTSujPNpuX1kb
	 NpY0IKffg3WvUdjAW9fasuRfN3gKsb5/Eh+F4nXnS8tO1H1aXCs9V4G4+K+WHRtIJs
	 p2yCgzzZVc/CGT+yGLqmD8KEJTdzF6nShFXACuFIMRtvE9Ar34D7f1fLhl7o7UUvBK
	 vwnNgKv3igW3O2XQ2M1XQrNo=
Received: by mail.alien8.de (SuperMail on ZX Spectrum 128k, from userid 1005)
	id ADED340E019C; Wed, 11 Jun 2025 16:40:18 +0000 (UTC)
Date: Wed, 11 Jun 2025 16:40:18 +0000
From: Borislav Petkov <bp@alien8.de>
To: "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"git (AMD-Xilinx)" <git@amd.com>,
	"Simek, Michal" <michal.simek@amd.com>,
	Tony Luck <tony.luck@intel.com>, James Morse <james.morse@arm.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Robert Richter <rric@kernel.org>
Subject: Re: [PATCH] EDAC/synopsys: Clear the ecc counters at init
Message-ID: <20250611164018.GAaEmxctC+ESUCvBNT@fat_crate.local>
References: <20250528065650.27646-1-shubhrajyoti.datta@amd.com>
 <20250603090536.GCaD664IbJB5IoR06g@fat_crate.local>
 <SA1PR12MB894764756C6538EE985BDE24816CA@SA1PR12MB8947.namprd12.prod.outlook.com>
 <20250604093735.GAaEAT39KGW1KJDrjD@fat_crate.local>
 <SA1PR12MB89471067967E0A5F46CEE1DF8175A@SA1PR12MB8947.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <SA1PR12MB89471067967E0A5F46CEE1DF8175A@SA1PR12MB8947.namprd12.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_094037_982221_2372D2C7 
X-CRM114-Status: UNSURE (   8.68  )
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

On Wed, Jun 11, 2025 at 11:42:33AM +0000, Datta, Shubhrajyoti wrote:
> However the registers for Zynqmp and Zynq is different to differentiate
> Should the usage of quirk be fine code snippet below

Right, please send a proper diff - it doesn't have to be tested yet and I'll
finish massaging it.

Thx.

