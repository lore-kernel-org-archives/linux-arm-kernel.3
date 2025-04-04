Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17305C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 09:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+JGa3fhJPG8h0GrN1ej4PUvOsob3aigTAptTlepjKQg=; b=Gy0T6KZ1C0msvpQqHSAqlJPuhb
	kHGWw848UsG5U+IvLBhQjFSsBVDEsjWqZ7pthAzehuhdtU7C1ohcg5wIfdAdIq6DH5oIsy5I4zHo3
	VIZSRmTxWTIlLV838WQb/Wd1Z5AH2fLvho3wbmEgR28zFZgOmDbw/ogq7F5Fa5CEQpPXkaxBaVZoA
	LG56/y7yACNAfYszmGqGZKTWw+BjQq39xAXEQaWB3yyoSqlupSb95SZ9tMleXHz4JGRIOy4x6sbmj
	WIk2gwuijT6gM6yLqg+IZn8OOoo0DYqStDwiV7Rw+pItv1YkKYtY/4AYJ0WS0UAW9KVxpRqDSxt/I
	eUnKAp7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0dPe-0000000BHrQ-1UPh;
	Fri, 04 Apr 2025 09:32:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0dNr-0000000BHc8-1QH7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 09:30:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2F24B6113B;
	Fri,  4 Apr 2025 09:30:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5338C4CEDD;
	Fri,  4 Apr 2025 09:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743759042;
	bh=nJrNlBkQnuThOsj6kBsx3+iq0NbYhsHpNmbL85Jx8Ws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KSY37JVeP/zQpypBtXQaaCMZje8YFlYL3lR9+GbS2ME4hCi/elUvVS/zn2MC7clKu
	 P1v21m/mBhALNaaLIL7jxa4cRT/wcxFiJOELsTdtiBUu3LtaHKdF+LGYzxF43WL9l/
	 3GCPruR1a4BM/E1l46zXm5KLDVMk0Bq79CQp6DDhCqZP8LM9qO1EBnd4bb6RV0hAcf
	 s4AiJMjHg2XM3jT1B9OrvHU6z/GDg9poEyDdWWm/9WOuP6dX6ngyFTytBAeeMMfqmh
	 Rw5N13xBnyXvaYld2XzaCoYorbEVbB7Ap7KcazFOQ2/LvFT8WdPoRYtVgTMI2941nH
	 x3WApBX7IDJGw==
Date: Fri, 4 Apr 2025 10:30:35 +0100
From: Lee Jones <lee@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 00/32] Samsung S2MPG10 PMIC MFD-based drivers
Message-ID: <20250404093035.GD43241@google.com>
References: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250403-s2mpg10-v3-0-b542b3505e68@linaro.org>
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

On Thu, 03 Apr 2025, André Draszik wrote:

> This series adds initial support for the Samsung S2MPG10 PMIC using the
> MFD framework. This is a PMIC for mobile applications and is used on
> the Google Pixel 6 and 6 Pro (oriole / raven).

When you resubmit these, please note that MFD subjects take the form:

  mfd: <file>: Succinct change description starting with an uppercase char

As seen with:

  $ git log --oneline -- drivers/mfd

I don't mind changing one or two when they come in, but I'm not prepared
to manually change 20-odd.  That gets tiresome real quick.  =:-)

-- 
Lee Jones [李琼斯]

