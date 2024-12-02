Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1084D7830D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 11:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:In-Reply-To:
	Content-Type:Subject:Cc:To:From:Message-ID:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uc2zRevH+Kbf5f8VX30G7BEfhLIb4tv53u+IgAXh0HE=; b=unSAcuWiLPoHTOX3y829F653Fx
	CM+sGn/zsYq6phqgs1t57y50GkKNXVWRKTdMs1zlQWf1U1Pi6FNf64SnGyqSZ7sHifLqZXtxW6y5d
	UFyLJvCDPrWLtZYL1MTyntEiS9SENcgZHaaYPKtebsHiwBYYa/ylnQxplEnYvTGpI+3KEJO/EwGtN
	T8C7utdvTcUcKdKtemfn+bCZcNFe2fWYKyc1beUWY8iX7FzbngiCoz2YZHXr9oDnoHTQ2xMvfhBZd
	FJPYp5i6pw0F+b9ZbTm8ae5uvE+YvEf9brCL9F78Ro5+b2xNgvdaKUyEj9DfjUkoS0W547cCqPZ7H
	pu7GL9BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI4f2-00000005uPR-43oB;
	Mon, 02 Dec 2024 11:32:16 +0000
Received: from mout.gmx.net ([212.227.15.15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI4Ss-00000005rUU-3ITJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 11:19:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1733138371; x=1733743171; i=frank-w@public-files.de;
	bh=Uc2zRevH+Kbf5f8VX30G7BEfhLIb4tv53u+IgAXh0HE=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:In-Reply-To:References:Date:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Wec/KeoXhkciOJBV6eBagwb9ZRB8LrAUfI5G/Pg0WgjGiwciB/OiLRGJySznAJ23
	 9s+esQ/3WuJ1S6XDMqetDB9SkdNbEQ5LDiFNgUbc2HMG+leP5KOWTMCg+Gu3zL//w
	 BehYLhgyYfWN+Sr19qD1iwYH1D68XGVuukOFXtUcpZ20og2pY4tFFo+e9C3QI3Kcl
	 +BNMrYsiaNSR5t7fZ5YBpgGaXwk4Z22x8tt4z6Sd4N+vF6vk/KLoWKpHA+koOJTxX
	 LQ65YipH2ebnjI8h522oAl+clyGRCstdqpDM10lQpRTEaQkZGPcFKmfFdygXtnDCn
	 al8nwjkJXfTaNVTi8Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.149.104] ([217.61.149.104]) by msvc-mesg-gmx005 (via
 HTTP); Mon, 2 Dec 2024 12:19:31 +0100
MIME-Version: 1.0
Message-ID: <trinity-796b046d-1857-413e-bb82-78e700d6b5ac-1733138371404@msvc-mesg-gmx005>
From: Frank Wunderlich <frank-w@public-files.de>
To: robh@kernel.org, linux@fw-web.de
Cc: dlemoal@kernel.org, cassel@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andrew@lunn.ch, gregory.clement@bootlin.com,
 sebastian.hesselbarth@gmail.com, linux@armlinux.org.uk,
 hdegoede@redhat.com, axboe@kernel.dk, linux-ide@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Aw: Re: [PATCH v1 1/3] arm64: dts: marvell: Fix anyOf conditional
 failed
Content-Type: text/plain; charset=UTF-8
In-Reply-To: <20241111203611.GB1887580-robh@kernel.org>
Importance: normal
References: <20241109094623.37518-1-linux@fw-web.de>
 <20241109094623.37518-2-linux@fw-web.de>
 <20241111203611.GB1887580-robh@kernel.org>
Sensitivity: Normal
Date: Mon, 2 Dec 2024 12:19:31 +0100
X-Priority: 3
X-UI-CLIENT-META-MAIL-DROP: W10=
X-Provags-ID: V03:K1:WmbuKwIPUaMaoZ+9pCvV9RhiMoPE8aSF6dGD7Y3Nc/IQ/9StBY9DKphILNMLZlJqknJ9E
 22lbCPY5SsDehMLGZNaTmqa/nNFgGyTW0cKhlE0F1fRPE4GRukXuZsv14PbI4M4fW79O7ZeWfCJz
 tTbCH2I+WuMTY1eD+lrVwb7pAj32hbJr+UkN2be1L4nNJa0NZY9VZXCo8yZeGp19+t765eQQNbF0
 K1SQuxf1K4c8x/zgRx96LBFQiVUW7S9KpTINmN0VJfuRnEaoTskk2hZMQklgiVrZRmMZ8zKxXMPM
 ko=
UI-OutboundReport: notjunk:1;M01:P0:m9D9NzYozQs=;85UGk8rqymSyuI3OwojybuLO3GM
 UzBsf5kQqXGnWY+/ZM75mW9LXJe5ChShlEBkEXQsFwAntHp27dd9bKrIlWhbLptifFX2f4xoW
 qAPKogLJiykB3Vjqyrd6OeORAwsK/X4sdHB5unZHYzSnqpEpFi1S1Y1z8aN+GjEcVNr4LVSVV
 t5wXNEGbNyIYMHfXodIANnQGJl3EF/s5n+9wPxQ8dHOJCfEUryCDYAcfQoYkGgmkO1SI9rDXL
 hUhS4ob9LdfrGw5FLbxSZtUd867HIxyzzzjn6fyO0osxQNs4iV+5+luJWMyJ4OSke0+4PsHS2
 6rdVzB7n/YLGumzcc+k1vTz+scIQhHHmExn0TXYl7mhPgOlP4QlKkUgmrK7S+HQesWQ8u3SzN
 /oZ2YcKqVmZp5mFg24ibj1YX36vuhbH/Pgi7aJ7jmfaW1UInmBpF7LEJ+UOkydWeBxfH9lpqM
 7xuRRvl0VQynUWz2qpa2ty1r3Z3d7BhOpFSPBNYwz/A0iYv+yyzJvtItW7uwk61OPTyu6ibL9
 w4YulsxGea4tbIA9090GQwzq9FOQ5fQSiYwMTCp2sK+U0yi8Y9IArhl2BYbuvLGQy41bgQYwQ
 foS/VpaVXSMi2kFF7OJigs9huyBjSvcmj0l8Win71FfRAEazzdyxxl6R+fQwfSyvyIF6JJWEe
 1Et7eIiFcSMyvI3hE+YDzMu3orgMYKz2S5ETjf9FLsY00pxECZlcggTioBL25EIA2DGZbgkmn
 QkkZh5Cfo8Ax/GC0arE3y5fIWNe9N2sRxPqwH97q2S73GOTua+SN1FKXVrz3cHRTvhIVZMILe
 92ZrENpAxtCW7RKeIV/Mxl0KVSC/ziBDhZo1Hf0qt0MB6WzySA9fJzLDs+5EUi0sRQ5ylEYNk
 WbeyohRrlcALr+IdHlP7adqAIKQ7Z2zJNQqA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_031943_183011_3C9D3B3A 
X-CRM114-Status: UNSURE (   4.25  )
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

Hi,

just a gentle ping to have it finally merged

regards Frank

