Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B473C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 12:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ErBa7+UjArO+55YjZ9gqUOEbafHVptzJdn3lXICH5kU=; b=GBKjVQ596aPe1GS6V7oFpz2iFh
	PA8ySSzKSBikV7C0WsgTFR6qN7AFXG4lSS+ihWInGpVB44hFi0RV8edGQGcaQGHSvVtavytwXzkXu
	8EhvrlUc4mTbxz8SBYRkrVLaYKYPfFCO1URC0PY1P76qMibwKOyxvz4vxs6Mcj1G43djUv4iSUyzN
	m/+phzHahQzSLCJDilKu6sPF4+AX6OPt+ddb9zz0MUICDLZ60k/drs4G9//wdkpJuYlS9kJhVny+g
	TBvBFFMtgV7kLUwzy7ArDdzOdxTsEMBlh66aLLCkBa+C1dv7VoadppwT3Up07kF7VDoRD+w9AkA8D
	9MBI0V5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whnif-00000002NoD-05fj;
	Thu, 09 Jul 2026 12:19:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whnia-00000002NmV-2uto;
	Thu, 09 Jul 2026 12:19:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 24AC540AB2;
	Thu,  9 Jul 2026 12:19:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDC631F00A3D;
	Thu,  9 Jul 2026 12:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783599544;
	bh=ErBa7+UjArO+55YjZ9gqUOEbafHVptzJdn3lXICH5kU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=a0fV7YAysv4KJZWmUWH7UGP5s37f+VQxAcHZtGGw9y/479RWKOCQGq/QZheWPqJYp
	 7Fi8gY48k1QvrxC6BM8exKaX8lkkgDczfYiAsAhpTTMQv+fXLYIjuroN2e0AjuvoyD
	 mOK43o5j5zk88YunXItS7o4kiCc3AaOV+psKCwCvgHx1ikaWbchbRgEZuBsa4LNhSR
	 Ss70bMy+aSxHDUx527VH/wcghxprW3WM6eSXacz18MBZyivipldob6a+VTSweQKUR0
	 3fWWFSSj6JRoZPxHWj1UqOh5AL3RcBRWgz+2twt7G0gGouJJ3ASLmXmL2yoHPjYeyt
	 GbavE85czsycQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20260704124352.7981-1-pengpeng@iscas.ac.cn>
References: <20260704124352.7981-1-pengpeng@iscas.ac.cn>
Subject: Re: [PATCH] regulator: mt6363: add missing MODULE_DEVICE_TABLE()
Message-Id: <178353557275.26140.6129042207824618409.b4-ty@b4>
Date: Wed, 08 Jul 2026 19:32:52 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1130; i=broonie@kernel.org;
 h=from:subject:message-id; bh=QGgAuc8kvyRqplVzSqiyOB3T3WMIjIQLy14/UIpf6lU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqT5G19zRj4kse2z2+hrjwgqs2feuBtz7ykzz/4
 1mg/LgVzZuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCak+RtQAKCRAk1otyXVSH
 0P5PB/9oiFAy/5JTcWl60nJ3O1AVIz++cSxBxQGGFRqQApKTgdXkjzLSuJ3uDK5HTYVRwMA3Dkc
 hoiKFri+MxXfGCZb4UZbx6336zChaJv0I5vC6LkaxTU0bJrQSb4ywJxrlcn8CDbTe370MnLG57v
 OESCq/pmXYkr9lXnXeProJ6XhA/I5P+q3NicZKONZJdqMFwnmFLwbDJ4kzIfOoucFL0gTj6h6Ug
 brGj6Aq/7iTUtIkd6wc4WDD0j/kdfRDg9e77K7HYl6r+zVt5Rmkqj9EqAtuihWREjMk8F0LbBb2
 TrYWjwMmv9PFRuQ8eRhxzTVXIwEf/dPEigoBjZSwx/bTua88
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

On Sat, 04 Jul 2026 20:43:52 +0800, Pengpeng Hou wrote:
> regulator: mt6363: add missing MODULE_DEVICE_TABLE()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.2

Thanks!

[1/1] regulator: mt6363: add missing MODULE_DEVICE_TABLE()
      https://git.kernel.org/broonie/regulator/c/87063bab4519

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


