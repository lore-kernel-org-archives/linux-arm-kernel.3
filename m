Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AAE9CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 13:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bm87lO1WY51W1JQZ6AFcWt4PscTutQWjvvP0wDQnS1Q=; b=ehRFK7gnDLcJ0c0M9lJFJ8i2cO
	DUTIdvGuJHK0/Nwzy78BJtG7/TeCZMbdbZHYzYVvfZYt9qzcjMDmTI+s7hi3wDQ+Di15mvgTydvdj
	Ncy45ZmHDYOVWyZpZjyhlF3v70K162uxmVmXoL6f9C5+3gQaVyNlB9989ZNPFnFiPSqkimHt7PuGB
	0eRrF0WPxTBidi+4Jli3rBhzMcn+RUR1CgseAI6kMNVfyGucEKMaMFOge2qrzUjBCLhPcHj4kCp0f
	ATKInkoFuvdv8Zo0gRwFMHjtdh/SqeUFKwzTu2I+NENwIaQtkafrg3bqcHzE7dDEGPTvbZOPKVPFM
	0y2dbJpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc0rz-00000006Jwo-0Nzo;
	Tue, 23 Jun 2026 13:08:51 +0000
Received: from out-183.mta1.migadu.com ([95.215.58.183])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc0rw-00000006Jw1-49VR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 13:08:50 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1782220126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bm87lO1WY51W1JQZ6AFcWt4PscTutQWjvvP0wDQnS1Q=;
	b=Jfhz3xEZlv0Q/ZeopIdCK4IgxmFSrBVcWyz29qGDLMc8XkPXOHioHSga9BlFaVxY9HuI9a
	aqAMSygPKToaLFrwHsPS/k7X6p7vGrWrslP4snAR90xFkskfU+g9BWurucH1/2VEyc+OkJ
	ZnvbLs1IDCpcOPj9pnMCkJCOEaBKhm5g9q1bXncD6Jk7aRotmJqW9+fmunVLMtr1ZnUpr3
	lomYuMOsjFeeIae+QHegz/esBPyhuYs41Sfx86eHE2nimZXQ0g/LqlNhBKZ4YsM2+IkI+W
	+5E/KpafopJ63ZXZAdaA93513l1NksHGgrDh9kORk5tTqmrOjDJhiZz1GAFevA==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 23 Jun 2026 15:08:36 +0200
Message-Id: <DJGGAYJ6I48X.1EWZ2H4TB116A@cknow-tech.com>
Cc: "Nicolas Frattaroli" <nicolas.frattaroli@collabora.com>,
 <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "Ricardo Pardini" <ricardo@pardini.net>
Subject: Re: [PATCH v4 5/5] clk: rockchip: rk3588: add GATE_GRF clocks for
 I2S MCLK output to IO
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Diederik de Haas" <diederik@cknow-tech.com>, "Daniele Briguglio"
 <hello@superkali.me>, "Heiko Stuebner" <heiko@sntech.de>, "Michael
 Turquette" <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>
References: <20260419-rk3588-mclk-gate-grf-v4-0-513a42dd1dcc@superkali.me>
 <20260419-rk3588-mclk-gate-grf-v4-5-513a42dd1dcc@superkali.me>
 <DJGDSS875DDO.22TYPVYK5X8KZ@cknow-tech.com> <2100447.PIDvDuAF1L@diego>
 <20260623123316.4111002-1-hello@superkali.me>
 <DJGG8DEAKSPK.1GJ8FARAHXPXM@cknow-tech.com>
In-Reply-To: <DJGG8DEAKSPK.1GJ8FARAHXPXM@cknow-tech.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_060849_184912_D7CF6EF7 
X-CRM114-Status: UNSURE (   9.38  )
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

On Tue Jun 23, 2026 at 3:05 PM CEST, Diederik de Haas wrote:
> On Tue Jun 23, 2026 at 2:33 PM CEST, Daniele Briguglio wrote:
>> If that turns out to be the case, CLK_IGNORE_UNUSED on the gates is a
>> reasonable way to stop the kernel from closing a gate the firmware alrea=
dy
>> left open, for boards that would rather not switch their DTS to _TO_IO.
>
> I'm not so sure I agree that CLK_IGNORE_UNUSED is reasonable, but I'll le=
ave
> judgement up to others. I'll do the test regardless, though.

Ah, just learned those should be added to your patch, in which case my
objection goes away.

