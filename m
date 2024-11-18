Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0491D60CF8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 23:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5YA+2O5w3UcvGZwj+4fBQK4mupKc+AU1i9UHimplMg8=; b=HomVn1Aoa5DnM9ZBog1t0ErysI
	iCNvMRBc6n2Xf1bsu2tHlKh1aXh0Z/c8S4+BSh/6rQ5bC/bg8u2ia25hyqxvWqZYnxw+TP+YLrrEo
	wmcoHriOEQHe1GWCt2zjph9Y287AT/P3IISrUlM1cXgReTExAIA+qpgGbvP0TcphlEBX+kmFey6wQ
	fWlEMlh1sVgr9Z07iaL+TV42ZW0iV4SzJQZInCqoKK1Di9z3cHT9bOIt5x3gAoATcMiFmjqfV2vY5
	jhKFna+trTxQWGxdFpi7MrkNoE3EUPwaT8b9ZTVL6CKUTGpTX7sG2hholPoG1mCud1/G/bDfuRZ1V
	eLYRTEcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDB13-0000000AqZQ-3cPy;
	Mon, 18 Nov 2024 23:18:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDB08-0000000AqUU-1FzD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 23:17:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AB8955C275A;
	Mon, 18 Nov 2024 23:17:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D3DBC4CECC;
	Mon, 18 Nov 2024 23:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731971867;
	bh=OvXvM2E99DSjnfFLyji29EGenbkDcaiD6/Z4ll6N810=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DVNlbLU7uvgL1I1lpXX2yNW271jc670eqjyWSoSS7UPVU4ScBaHX3plMdtTm/0AQy
	 bgPP8RxVfjWgrkL59tqU3VJ2Hns80D2rhBsAyHL3zJTba3K8Zoupq/2Ihb7mcDTPY4
	 JLh5z1qALMvI4y42rasDHdYfh1hWFH2bUS1f6/5NtVVCOh9MR7Wo5IJZ9aM2mFha/B
	 3kYgZMs8UiMYIPMJufqmitKZsPqSVWayux60OPcBnt3Tu/0xz+o1dyYSKhj0Jv4AQs
	 6FIs6aEnQCi4BtmWtC6roFDfJkIUtQf+0YtzfWMSG+0lcXa29/3zsYij8/MblYBSzI
	 fjVV1eu4VSaJg==
Date: Tue, 19 Nov 2024 00:17:42 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, =?utf-8?Q?Gr=C3=A9gory?= Clement <gregory.clement@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Subject: Re: [PATCH v3 0/6] i2c: nomadik: support >=1MHz & Mobileye EyeQ6H
 platform
Message-ID: <gmntz3etrrxvngvp3dk5aoq65lrfe3fiulcalvx3brjj674wjp@xyupnszzsfvr>
References: <20241009-mbly-i2c-v3-0-e7fd13bcf1c4@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241009-mbly-i2c-v3-0-e7fd13bcf1c4@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_151748_380238_4EF09329 
X-CRM114-Status: UNSURE (   6.19  )
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

Hi Theo,

> Théo Lebrun (6):
>       dt-bindings: i2c: nomadik: add mobileye,eyeq6h-i2c bindings
>       dt-bindings: i2c: nomadik: support 400kHz < clock-frequency <= 3.4MHz
>       i2c: nomadik: switch from of_device_is_compatible() to of_match_device()
>       i2c: nomadik: support Mobileye EyeQ6H I2C controller
>       i2c: nomadik: fix BRCR computation
>       i2c: nomadik: support >=1MHz speed modes

merged to i2c/i2c-host.

Thanks,
Andi

