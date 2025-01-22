Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC56C02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 07:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bLhENDXDWec2i1XTk/supYgZGvQ8Y32ZZKuSoObZXG0=; b=a9EAQFCdytCvCLWGc2+JFUpt/k
	0f+Nrnti2jzxM4k/DyEhu9FuApYsDtKrIBFCXzS2EGbzi7DldjztOlXFuanDtSRqOyCbykUlHTQvW
	KdqZ1YkOePwwEboX4+4LKQNbFkuaWShTBX8h2twScVVVKzuin8KyGLrm6MhOd2ht2KqiAPeqDvBHZ
	0Ax2kl9IHsHaUfKkRsVhOhYgUpZeIRmkeESg3YAazkL1wJH3zYPXqw1ISz1Ws75Kf2iaSMnAqrccx
	9ykaveMvXDUkXSIgwTkSk+ih7OrYnQe43KrYq+TnZK3TTK0yN+eUKkCjNCCuxGGuTVFAioLY1JgQ7
	pz9+exAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taVb0-00000009eRk-2CWl;
	Wed, 22 Jan 2025 07:56:18 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taVZj-00000009eJn-0Nm7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 07:55:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A2B99A41BCC;
	Wed, 22 Jan 2025 07:53:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CEB8C4CED6;
	Wed, 22 Jan 2025 07:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737532497;
	bh=DS6LctAEbb86wdU+xIObFSbsxNIQXD0zFVuUopbBhSU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PulrbTE6g2iDQO3tZkVzV6r9hofz+rdLvtPZoXz/HqrSx8WreicvBiya25B2KD2XV
	 8QjKtbeqVyF8EuKFyjQzlqP3OflmIEuBWBi1a2zXerqtfstshGa63g5XsGxlKpI5bA
	 4JX3y6Zc5vTD6tGYRchqvSCMRMa3KwbFSdoEQwIBSgb1CG00rWRAL0LmZbfTzLqL5Z
	 gTnwg4R5Iya1CoOYWCz5pvBxsA0T4OzdlMw0L7kkHekJS+wsJIjN0hIxyGak2PZ7Tu
	 wQ783czlWRQ7c+CG614lqSxuX4uP8X9+DLeGG7tl/lxeO+XTEcP+GXbCVwu2dcbgc7
	 cS8OB41qVUQYQ==
Date: Wed, 22 Jan 2025 08:54:54 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	kernel@pengutronix.de, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Leonard =?utf-8?B?R8O2aHJz?= <l.goehrs@pengutronix.de>
Subject: Re: [PATCH stm32-next v3 2/2] ARM: dts: stm32: lxa-fairytux2: add
 Linux Automation GmbH FairyTux 2
Message-ID: <20250122-thoughtful-starfish-of-grandeur-ee7919@krzk-bin>
References: <20250121-lxa-fairytux-v3-0-8d42d7d232fb@pengutronix.de>
 <20250121-lxa-fairytux-v3-2-8d42d7d232fb@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250121-lxa-fairytux-v3-2-8d42d7d232fb@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_235459_196009_221B45EB 
X-CRM114-Status: GOOD (  13.08  )
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

On Tue, Jan 21, 2025 at 12:14:06PM +0100, Marc Kleine-Budde wrote:
> From: Leonard G=C3=B6hrs <l.goehrs@pengutronix.de>
>=20
> The Linux Automation GmbH FairyTux2 is a small Linux device based on
> an Octavo Systems OSD32MP153c SiP, that occupies just two slots on a
> DIN rail.
>=20
> The device contains an eMMC for storage, a gigabit Ethernet
> connection, a CAN bus and a RS485 transceiver.
>=20
> Add support for the lxa-fairytux2 generation 1 and 2 boards based on
> the STM32MP153c.
>=20
> Signed-off-by: Leonard G=C3=B6hrs <l.goehrs@pengutronix.de>
> Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
> ---
>  arch/arm/boot/dts/st/Makefile                      |   2 +
>  .../boot/dts/st/stm32mp153c-lxa-fairytux2-gen1.dts | 103 ++++++
>  .../boot/dts/st/stm32mp153c-lxa-fairytux2-gen2.dts | 147 ++++++++
>  .../arm/boot/dts/st/stm32mp153c-lxa-fairytux2.dtsi | 397 +++++++++++++++=
++++++
>  4 files changed, 649 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


