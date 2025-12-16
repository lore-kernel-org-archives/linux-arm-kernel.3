Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C6BDD5B87C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 07:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/WqZmR4Vfz9/dBRtVf1CYIhMILZtNCXgTxZi8oWR1Vw=; b=3fCAMSJEW3wC4MOHP2S5ZLCMsG
	DKIeDIq1IErET7nlTJvU6vi6DnpYZjA0OjA92QRVqcnDE5xgUbYtIC1iI0BwaQBVweaesaQ2COAm0
	GoEyXmYj9irdxIKSnF/OyitAvm448tIJbwQH1DalEPghlfs0xx1ZmeZ7ludskeOsqovQ+vOrtRZZh
	l2Ayyc33G4ZV8gE9hQ/t02K9mu+BboLLws7IwKUehoAeyoDGv/ayOmEEIz/ElO0VAPsNu5FOIQ+zu
	VITC9BsYjr44OX/+UnMwC8bvPWXy1+9/epXkzNlgs+Zi1rnpjmkJ/FChz54VAKtABC1Oh6fF0RtU6
	NF0ePGEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVP7j-00000004pKq-0cy8;
	Tue, 16 Dec 2025 07:05:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVP7f-00000004pKK-1sXG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 07:05:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9359943E4D;
	Tue, 16 Dec 2025 07:05:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 852C8C4CEF1;
	Tue, 16 Dec 2025 07:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765868726;
	bh=yWT6Th47hFpbIGS7HXZ8aLzlkC3HmltK55X0UShFCTM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JOWApGJhdPElDrwbDqe/1NFc7QdgD6oGFUCTbXGRjDalQ0vKW8hXFOTcKcJ/zgo6N
	 t/xbDC8KB716LUTvUp1YiE9st9BSzXLfzfSilO8+FzBzxuEmpOdTHXdGgfurhI+48x
	 5QBggBukq2gJh6Mt07KdSlUdmqr7L0ND0WVI2K2VYKarIJ5KQb12aEDdQ9p2lkLLBx
	 3Ytyb07jKudeX76iEDzashmJ4+fiuLfF5LSoOZneMSZoq37AN/MGnb3lq7pqiDx819
	 Y5dIo085vkyR/YxvXMZv1cfcI1QU+T5k1POF5HUZ8OXDBbcOlf+8xEaUm6bkQNupDK
	 Mg7V6dQqs6aqw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-team@android.com, willmcvicker@google.com, dan.carpenter@linaro.org, 
 arnd@arndb.de, robh@kernel.org
In-Reply-To: <20251114-remove-pmu-syscon-compat-v2-0-9496e8c496c7@linaro.org>
References: <20251114-remove-pmu-syscon-compat-v2-0-9496e8c496c7@linaro.org>
Subject: Re: [PATCH v2 0/2] Remove syscon compatible from google,gs101-pmu
 node
Message-Id: <176586872327.22265.10311318295410886509.b4-ty@kernel.org>
Date: Tue, 16 Dec 2025 08:05:23 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_230528_071941_A632C4F3 
X-CRM114-Status: UNSURE (   8.52  )
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


On Fri, 14 Nov 2025 12:00:15 +0000, Peter Griffin wrote:
> This series removes the syscon compatible from the pmu_system_controller
> node, by updating both yaml bindings and device tree.
> 
> Since commit ba5095ebbc7a ("mfd: syscon: Allow syscon nodes without a
> "syscon" compatible") it is possible to register a regmap without the
> syscon compatible in the node.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: soc: samsung: exynos-pmu: remove syscon for google,gs101-pmu
      https://git.kernel.org/krzk/linux/c/411727d9182d7a067fdd16a125d2069f52e8bb7f
[2/2] arm64: dts: exynos: gs101: remove syscon compatible from pmu node
      https://git.kernel.org/krzk/linux/c/a21d38b5e209c60e73f81e467cc53ad57b5d4080

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>


