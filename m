Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 645D9606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 11:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MuKiL5IQ;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZjvCiAz/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=8ZqHKrTZAa7k2c+zRd+2kFVhc7BZE6cjwLl6WJGjDT0=; b=MuKiL5IQdMBu7R
	QL/zxO7F5INUR27r+sM1VpEydxtnG7cDLPchC6g8EL7DBJuiYa27AIBW67vYOyL0pozRVOK/ZDX8q
	AyRJiX2S+1sOfUAbvpHg3Eez1wrIyhgmEI1BwIn4L5F0rfejRU+Ug7JAN+LT7YPuEnmD06sRfPnOC
	PecyCx5HzxUcoKn44jhei9ZbuePdrmLRIze8Rz48jZV05i277BRIaaxfHhZWR1ZPAxSwn97LpRusW
	wjPYJ9LntCyHc7oB1nfVNTnMbNvoKpWZZFXpzWzptPdUtUcPSTfseUi2MaoZug2z31jx3VJH96RHR
	/15ZN6XbH7dy7vrDlzKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNTQB-0000000E7rY-1rC4;
	Sun, 01 Nov 2026 11:08:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNTQ9-0000000E7rG-1rBX;
	Sun, 01 Nov 2026 11:08:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DD34A60220;
	Sun,  1 Nov 2026 11:08:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 112701F000C1;
	Sun,  1 Nov 2026 11:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793531296;
	bh=8ZqHKrTZAa7k2c+zRd+2kFVhc7BZE6cjwLl6WJGjDT0=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=ZjvCiAz/R3hHYCQjzSwylNYDqpP98D94MjX5tXYTpgDdSYBgmJRdGaDqRJ/SVUmNg
	 B/t1mA+yCqsP6rgUO/wGmi4JypUE8Wnb1JgOJzzHZNbjyBttMCt6ygoaELLEtlsohW
	 6VXkd45iPPsuJf3/5WYiVm+8trodqkNp7VogVtkQKnhwj0gBpuzuiwpvZ1WbcU/7jt
	 3S1kG2VnP3pwEx/AsVwCjfngRDyCRwzqNAkjb+JRwsZIx6SzphdJr6e1wDIu1mT1S+
	 pXCNoHQq/SkiNDPBrYwvMmWISfMYg2x/dyULBmpinzFGU/UlIVWErRD/j35tOF5Xs9
	 GCpeT/4lvQ3tg==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 2/2] phy: amlogic: meson-g12a-usb2: add S4 support
From: Manivannan Sadhasivam <mani@kernel.org>
To: christian.koever-draxl@student.uibk.ac.at
Cc: neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
 martin.blumenstingl@googlemail.com, vkoul@kernel.org, mani@kernel.org, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Christian_Stefan_K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
In-Reply-To: <20261025192202.209045-3-christian.koever-draxl@student.uibk.ac.at>
References: <20261025192202.209045-1-christian.koever-draxl@student.uibk.ac.at>
 <20261025192202.209045-3-christian.koever-draxl@student.uibk.ac.at>
Date: Sun, 01 Nov 2026 16:38:09 +0530
Message-Id: <179353128971.2955.5743207181968737681.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=863; i=mani@kernel.org;
 h=from:subject:message-id; bh=4i/UwT8KhY3hDwjDHgZhm00CnhxEntUWfkuk3YkQLrw=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq5x2c0yLz8HY/wgEQv3vpJxM4SQJtXqKuxtC0B
 LCogdcfNbCJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaucdnAAKCRBVnxHm/pHO
 9UOJB/9SBeD1OafxoTl/SwCaFJ4dyRTpOgVlCzWb3ZLWr3/uDJWq9lfhVJaKaSPNj3afa65p4vM
 jEUQsr/ell75TnsWQXsLZ/7orZpUz577RsM6FDvgzM1kbTdp0WUhtALxYwrjwuUb2BgYWSOIIwG
 6PLr4E2Bgd0IM3+WmSdqxR4NzBEm9JPx0nyzzQD0QwioiqTAJskV1J2COuAueG1h1BMdcAFw3Px
 qNr1m172yWnYquAJ5RgjlmHSCCZxQ6xIN8t9IZS1SS3Be9qPZbhh6+SqpufamxKLYN0fyUJk9ld
 hjL7EgcSLyjBMI/m+OVPYuun0La37tUVBHM+jqt/OagPGAmE
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-10-25 20:22 +0100, christian.koever-draxl@student.uibk.ac.at wrote:
> From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
> 
> The S4 USB2 PHY follows the A1 programming (MPLL DCO clock select, R21
> calibration, R13 analog settings) with a few differences taken from the
> vendor driver:
> 
>  - edge drive trim 2 instead of 3,
>  - HS disconnect reference 3 instead of 1,
>  - a disconnect threshold in R14, and the R13 PMA signal update bit
>    set to latch the analog settings.
> 
> Without the PMA update the host controller sees no root ports and
> nothing enumerates.
> 
> Tested on an S905W2 board: devices enumerate and work behind a hub on
> the host ports.
> 
> Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani



