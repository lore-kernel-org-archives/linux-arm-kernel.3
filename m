Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB77606A335
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 09:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PyD/s7RX;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KZiXeWzH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9KR4tQKKoouZdOn8TLp6tmMbElIQ1dBoDCjoVtfVPwU=; b=PyD/s7RX+8/1FhLaiQjN3wUHo8
	W0FsOB6GLZzE1teJYIQho3DnUYZ2EP19Rc2C7QOhZX5i1XaMjrBqCXSdqwVCUw3p0sJ6oAzFmvFhS
	JkUzzeCgcvtwmUAs/vE/kiH7AejoJTPNwsXU6qYKzq1lCu79hicD9x+dbrEb/mmvtXbX89UGj9YjA
	X/SNXHgJtnEPIBKrQB7Cr6gksVGz1AlsqhbyyJzc61W7UaFOhFBBMBR5dahY1QkKCSz2E/BWkhPSU
	7gRY0KsmdBCBJB/IejxXGyUtx7l3i2wTIQ5W3WIx513EWpvjjxa9jxYyEz/TdQkN7N2gaLtrn+xVk
	4EdHZGzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLdSj-000000049lO-41Ef;
	Tue, 27 Oct 2026 09:27:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLdSj-000000049kt-12iu;
	Tue, 27 Oct 2026 09:27:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A3014601FB;
	Tue, 27 Oct 2026 09:27:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9670C1F01828;
	Tue, 27 Oct 2026 09:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793093240;
	bh=9KR4tQKKoouZdOn8TLp6tmMbElIQ1dBoDCjoVtfVPwU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KZiXeWzHGXuM3OWjZ9ZZmKwmS8io1B07UgzhX+UL//aC9IJce1cAv/G31tLlAqztV
	 ViI2uZ2NoO1/vLNx7FvJuVWDrtTpIT1jWBuZXgAvRdGcu9HYkiXhnGtnD5JIkJYTA3
	 lAMomG+lUtjQfxw/m5Fz+hYLY1rHcqlvIoSE9tsYVRvjwBBkKu4ergTnoHykQGz5xD
	 xwnYU9hIQxeABBklziX2I+QlAwse406Le/AcKBJ1GTYOKJmB4jfBuRpzzg+RAI/Fql
	 uab6CyyjdeXEt5UiwQOu5bDTrr45h4M7ab5oAjloQs5LvgESUo6QhFs7jJcOZ5v8eS
	 3A+MqK6uEjapA==
Date: Tue, 27 Oct 2026 09:27:14 +0000
From: Lee Jones <lee@kernel.org>
To: Yaozhong Li <yaozhonguwl@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Chris Zhong <zyw@rock-chips.com>,
	Zhang Qing <zhangqing@rock-chips.com>,
	Joseph Chen <chenjh@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	mfd@lists.linux.dev, devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/3] dt-bindings: mfd: rk8xx: add board level power
 hold GPIOs
Message-ID: <20261027092714.GH2195460@google.com>
References: <20261027084511.1992-1-yaozhonguwl@gmail.com>
 <20261027084511.1992-2-yaozhonguwl@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261027084511.1992-2-yaozhonguwl@gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 27 Oct 2026, Yaozhong Li wrote:

> Some boards route "power hold" lines from the SoC into the board's power
> circuitry. Those lines have to be held asserted while the system is
> running and released before the PMIC shutdown request is written,
> otherwise the rails can drop and come back up instead of staying off.
> 
> Add power-hold-gpios to describe those lines and power-hold-delay-ms for
> the settle time. The driver reads them for every RK8xx variant that is
> the system power controller, so add them to all seven RK8xx schemas.
> 
> The array is bounded at two entries. Firefly's vendor kernel handles
> exactly two such lines, pmic,hold-gpio and pmic,stby-gpio, and its board
> files use one or both of them, with an RK808 and with an RK818.
> 
> The lines are released from the PMIC's power-off path, so they are only
> meaningful when the PMIC is the system power controller. Require that.
> A board adding these lines is expected to switch to the generic
> system-power-controller property at the same time, so the deprecated
> rockchip,system-power-controller spelling is not accepted here.
> 
> Assisted-by: LLM
> Signed-off-by: Yaozhong Li <yaozhonguwl@gmail.com>
> ---
>  .../bindings/mfd/rockchip,rk801.yaml          | 24 +++++++++++++++++++
>  .../bindings/mfd/rockchip,rk805.yaml          | 24 +++++++++++++++++++
>  .../bindings/mfd/rockchip,rk806.yaml          | 24 +++++++++++++++++++
>  .../bindings/mfd/rockchip,rk808.yaml          | 24 +++++++++++++++++++
>  .../bindings/mfd/rockchip,rk816.yaml          | 24 +++++++++++++++++++
>  .../bindings/mfd/rockchip,rk817.yaml          | 24 +++++++++++++++++++
>  .../bindings/mfd/rockchip,rk818.yaml          | 24 +++++++++++++++++++

Whoa! Is duplicating 200 lines really the best solution?

-- 
Lee Jones

