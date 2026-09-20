Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B5DFC982D8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 17:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qKpwjWPW1NdYTtKIe6euaznppBojWulsRMGtxc9W8sQ=; b=e3G1tqFXVMBK+Z8LBc4omnmITx
	7pmiIXhRGFlMCyILd6bFMIq9Y6PmBE1Sik/yHcOIL4qHb91JwDZk25FYV0b+2sM01c7wRYWM+ANQo
	wXpd7oKSmnZI2L6fcoI2ANG0AfHgxUJpm3Gp/9xgb0Ib/mxRhcytDqoAQJ5XtcbO6rC5fuN+sFe+z
	LJoSDP0JHpSp5q6F0xH2zUOpDaikrFX22cCTcHo7RHz2Kj0zlBCN5uktJVApNJ1LIQBPh0kl9Zx+0
	lsf+2WNiU6E8coRm5W7OUU/lMFulh4KPhIuL0Y4NPArhFv86/2n2sii4RzCp7Nq0vUJFZaZdmqHGj
	GRlIq6hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8L2S-00000000Av7-2BmO;
	Sun, 20 Sep 2026 17:09:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8L2K-00000000Ata-23iv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 17:09:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E9BF1601F9;
	Sun, 20 Sep 2026 17:09:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A8991F000FF;
	Sun, 20 Sep 2026 17:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789924147;
	bh=qKpwjWPW1NdYTtKIe6euaznppBojWulsRMGtxc9W8sQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=agEZLjOO1UxxCeMJBsjbPzFxZ4qapOmj56f2KgUJ2T2l4fekSQ3XeL3viZS4Rvisd
	 UbwRFs0x69Yz3jEXOyP9TIbCBYKcYCRSc/EL3WozZszVDOARO9c9noTqKLHHL25us4
	 QxMgqErtnirLM1azofAcvqvuviMqUs42TNexDtqQIjiez6o8gmfokxpYF7h9Grk5f1
	 0KbPZjK59bs6Vw4l4I2+TOy1fVHFkTVRAbhra/8ArtaWVUzohsI08tuNmXIX6SQ7y0
	 Y+RU44/Mw+TdfpxqxW7/a3pC8qxCQ5x/VOOgResK67UFQTQPbRn+oDmu/ZGtCpROr5
	 SsU777gEpuN3Q==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sam Protsenko <semen.protsenko@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alexey Klimov <alexey.klimov@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v4 2/2] arm64: dts: exynos850: Add acpm SRAM node
Date: Sun, 20 Sep 2026 19:08:53 +0200
Message-ID: <178992412364.36366.8985404551240087001.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260914-exynos850_sram-v4-2-253871de0f61@linaro.org>
References: <20260914-exynos850_sram-v4-2-253871de0f61@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=399; i=krzk@kernel.org; h=from:subject:message-id; bh=XOrM/upLRY+Wl828g0o39pfuHUwJmLy7QyJxP738Xpo=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqsBMlxljmafkYVOSo0jGiQHvuG8WHTF19JAyb1 SIHRSj6S/uJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCarATJQAKCRDBN2bmhouD 108QD/0YXteQAP3MUwMPRg7a7WlR91BSCRepj8sTrt+6oXgkM4+sAV5NUkjMgvWm1IZg+q+6mkI KmhZBOfuAKm3OcIexUAhKH0NN6MhNsEdq4RjWn/s5Yn7ngkbz16GO80alnwVi2hVR0qTJZu4L5F 4PmjACVfu8O85d0kJTyqcAIqQnJxG7KDGoeORP0zXt2Vt/4y/N+VtdxAuUrYzvSHso5k389fjX4 +s96ljMnS/kKsAVRfe1QiYAIah8sU9GAHtV3jnm7cqcjAvtgizh+BI6DA7jJQGZgODKHWxhkdD0 6UGN1iHcC9XUwcD/YfEP4HH7d5xgT1e5cDM4Pc20S4EqUnJIV/oAtwuViHFkPReUcPohQqpVQl3 FCEHMGPKjLmTS63RmjKtDFmfFO1+TUd5MRIdHuF+LjCjeBLQAbH74iQbe1icSlAgxPTFjR/UZF9 JeojR8X4LGUEcMbzFjE0ZQsZ/7T4K/jYn2NTvr9NzKp3QivEfofhwa3AkD16RwFblTUg4sAfUyU ia87eg914yncs62U9TuDXBHOCkn6bh+qWrf/Nm39v9TcbFOdhJHAwL/wbbBthxJcQwhR6lNI7R9 YwsDkjsH7i5t1NSkgIfAMTpptyaKNRVcs7H5MvKCLHp0HZ+NtA8m+fFsUwzZpHEhzAjSIvwlSVX 31jJu+5UmmD4x/
 g==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
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


On Mon, 14 Sep 2026 17:58:45 +0100, Alexey Klimov wrote:
> SRAM is used by the ACPM protocol to retrieve the ACPM channels
> information and configuration data. Add the SRAM node.

Applied, thanks!

[2/2] arm64: dts: exynos850: Add acpm SRAM node
      https://git.kernel.org/krzk/linux/c/089d44f32868e6a5fc3f817073b59b298fbc9e73

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

