Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8412D606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 15:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NERaGwv4;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=RjVIgmCE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SOxU1IrkJoChSZwtgAbY26YGaPbYGPCarslzge/kK34=; b=NERaGwv4GUESnR
	CHmMqqNRwONflr58EEVTSyF0A/Kl9G3bASCv69wrXST7hgomiq7wx2xggnBpsOFONcRngJNNLxdxy
	ccZEhYB4cqxv5ppciMnMVGbtFnHz4GRAphsZ7eRlCR1+YD9y0zRsp5LNnP8P2Lfxp7nyr6cjzVzCR
	n9iiF5abwUj/+C1k05mBUTOdSGAxXEDVE5BtKU+N38nkq4GasJm0XdDXmndTtL1OybAq7U2+JqosC
	U+ZqG9Lhts1KvoHQDdsATQWpnfGHNHm0MVbNP+EMHn1KN83VmcYHG/JNOMS/R9eUBvA0iGR3fcoJ5
	vfPrVg3yCeRR2wjjgfuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMoFI-0000000Bwuo-22mm;
	Fri, 30 Oct 2026 15:10:20 +0000
Received: from sender5-op-o11.zoho.com ([165.173.182.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMoF8-0000000BwtM-1ziz;
	Fri, 30 Oct 2026 15:10:19 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1793373005; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=l2OyCf0tiJGeMLyKQmnA/k2lxLUpwrcd2F0ZIhifaSwLHHwqO2KwHSNcEFQpMaHNlYXTTJmdI4iXw7+aD3N2MvLd5y0Y8iO8ZnnjGYh0DyLnD9faRyAY6x3awEiSP477+CaGgqH9vDi5HkTsQ0hCFI9IowA8iq6Z/gd3C6b5ofc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1793373005; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=SOxU1IrkJoChSZwtgAbY26YGaPbYGPCarslzge/kK34=; 
	b=PcEaetO0knlMfJket7z8i/SkBEKduaSB3zdNn06toYxnhktOvh4EG9Inp3qU4HlaU8CxLTFnAfKAQSi0R0jnaMYv5aBjPreHyesqyo5IPJVLkbtUxTVCj71A88bAh/EA38pKCble0x+fSCThZ1r++s5lYbd4RkZZtr3loVMxAMU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.dufresne@collabora.com;
	dmarc=pass header.from=<nicolas.dufresne@collabora.com>
DKIM-Signature: a=rsa-sha256; b=RjVIgmCEUVFEGqO23Co1WdR+lY69arY5m0Q8U+3SjKSU/Brnadrsm7sYS17Iw9KScewwqMR0KLb05GRdukcIsbITDeUsSNpJfH97wpAkA46COQoNUJUjgQUeauPSSTX96wUwBg7tWlK24Q7A4ly+XwJXKtCxl/HgNyfg3+eOS20=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=SOxU1IrkJoChSZwtgAbY26YGaPbYGPCarslzge/kK34=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1793373003647307.92338041764765; Fri, 30 Oct 2026 08:10:03 -0700 (PDT)
Date: Fri, 30 Oct 2026 11:10:03 -0400
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: <wbieganski@baylibre.com>
Cc: <zhentao.guo@amlogic.com>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <mchehab@kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<krzysztof.kozlowski@oss.qualcomm.com>
Message-ID: <1a18d5c5f7f.3e45f382588509.8172330954347509989@collabora.com>
In-Reply-To: <179337024629.131241.9227206619077693683.b4-reply@b4>
References: <20261022-b4-s4-vdec-upstream-v12-0-616240978792@amlogic.com> <179337024629.131241.9227206619077693683.b4-reply@b4>
Subject: Re: [PATCH v12 0/6] Add Amlogic stateless H.264 video decoder for
 S4
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Importance: Normal
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_081010_566580_AC8C3FA5 
X-CRM114-Status: UNSURE (   8.93  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,


---- Le ven., 30 oct. 2026 10:24:06 -0400 wbieganski@baylibre.com a =C3=A9c=
rit ----


> Hi,
> I tested v12 series on AQ222 board with v7.2-rc1. Firmware version:
> 'v0.4.ff.I0c83495.75444b3' build 'Thu Apr 16 18:18:55 2026'.


That reminded me, is that firmware in linux-firmware?


Nicolas

>
> RAW NV12 frames at the decoder output were visually OK across typical
> resolutions and H.264 profiles (main, high, baseline) with and without
> B-frames in the stream, also with I-frames only streams. I used Gstreamer=
's
> (ver. 1.26) 'v4l2slh264dec' element on Trixie with both mmap and DMA-bufs
> buffering (on the capture queue only). Input bitstreams where
> FFmpeg-generated (testsrc2 + libx264) or publicly available test videos.
>
> Decoder (and the output) remained stable with simulated (non key) frame
> drop at max resolution (1920x1088, noise generated by FFmpeg's bitstream
> filter).
>
> The performance at max resolution, tested with 'filesrc ! parsebin !
> v4l2slh264dec ! fakevideosink' pipeline was ~85 fps (fixed number of
> outputted frames divided by the total execution time).
>
> Tested-by: Wojciech Biega=C5=84ski
>

