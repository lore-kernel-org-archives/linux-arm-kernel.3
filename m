Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225C8606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 09:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2/yqsxbl;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JrOm+ZRb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9l2X88+Cluso3aHhPPG2aCJ5eE8RQhXDwPSZjiqGEds=; b=2/yqsxblsyO7Hh
	huO1jK4otcaXjDPmdVVkwR5qz77ZTzVtO1jE2pi6Iv65VGysP9eV/X4hfIj4GT5fYP7DN2sZdbM8B
	rLeGhyxCoJ1TStDSRZXDfhXTmwJoYo/hjjeHFeQiWQk0ZqHOkiwoLj559b/QU20dUVSUgfwkfyTAX
	wSGYt7E1+suxoekMhIChbxNP/HEh1498LNgX/Bcievk/ZAOOZiaf+hw1U1Q++fAh+J6f7gxrgmBxE
	bJf/IciLJLa4Rz2pB0y6Xf0tGVTxrkAM2sF5mEanmSl+a4zuCtSq7y3zzwPNYxSEKE1PbZkPh18a+
	P5AKKga8T1FmdmuWptdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNo7Q-0000000Fxbh-32lF;
	Mon, 02 Nov 2026 09:14:20 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNo7O-0000000FxZQ-1Oef
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 09:14:19 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-33fb4680717so4197022eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 01:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793610856; x=1794215656; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9l2X88+Cluso3aHhPPG2aCJ5eE8RQhXDwPSZjiqGEds=;
        b=JrOm+ZRbxtGY0OEkeDxqQ6R5k6cJE+bQAeT8CVkgl/wten31BLWxkFqJeS26xZF3C8
         5riMtQ/rwrysncRlMxrsWbZQ8A29BH2owpSkgagbm6cuN6Bvgi8U1iRwotyXkLYXxD46
         6kFA5cAR5O2iCgqD/g7lA9MSCUPe3ONomfmGONJLtkLfFycJmbtrmrxK/pSih65BreUx
         uAeA2u53jezIbJg6EumXqfdVBXKiiTUgeqNMeFivsoM1Z3sZXa9gQ7FbB1GiBd4ELS05
         9c+vo2LJuLxZf9z1LZJohUwgbJTofFXxQGeEnaFllrcVVe1t6Lh6qyBDrqkcyhwTycQk
         wprA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793610856; x=1794215656;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9l2X88+Cluso3aHhPPG2aCJ5eE8RQhXDwPSZjiqGEds=;
        b=YCVZStAxCt//XPCXQiqnIoysfQm5enkbNZ5ZSfj9sh5KrVVImlwAUk2r+Y5ZM+1CPH
         EbnSxJqaVw2AoFGjdH8nRAWdzuXu3f8J7RdeZANhYlEL0sXMdBo51IXdsPY+Ss+Jm1t+
         Xy6G73wTnsnnTp45+40QWKK7o6MMTp99sNhQ5U+YGsVFnjPVU7LFVW4KgokfTIkwRQBd
         WdBnSNPUca0vdvpRmJXJ88wENkxAl1NfWSb0hCHIJtVZUNo9V1H9g8ba19m8ODs8Uq5D
         g51pt1P/A8eUjZWW54IBW3P9dWX0UUcBCfZff5YoGwCkmzzVC+l7+CQArEzQezkWpUOt
         rCWQ==
X-Forwarded-Encrypted: i=1; AKwUvBzTAt9DNEyEYilKeR6cqBQQZ1ofnOLQBFDUTSbAhuAQ8XQitoL0vHWh3QJcdPJTovDlqm5fsbs4xKZ1IE8U3Plh@lists.infradead.org
X-Gm-Message-State: APuU4Z+cRHQr4vK+kvMYZw7w/UkxCpnhjilEkVrvo9LSG6UzF67klwdU
	qreThtBcKG5kVxMm/hbroEje6uZ4rThIwpbcdAmywOIWihwIhdL9zxQt
X-Gm-Gg: AYBFou10LVA2bkqaC72iTlWPiMnA1CIHQC3KekU4yJxUDtLn3zgWILv/Bm//pSzEuWJ
	d83qESj5dnBpVyWK52Midz7F47oe3yvvfp+g6SqI5+VB0gDUp8wf2YYFmq19KmiPb+JyYhtSrhr
	NIkf9XHtHV0HWevqrxViDJJin9ytyar9pQp1947rt+vIkTjfCCOxvKyWVTLDfvaj6qb20V/PmfD
	ZIwYNPQmPZLTqde/+8kvDdndVHUReWF4poi00xSWi6uCKEMbfCH7b/E3YlVtjRDN3q/T1IPlkh1
	oFEv6phwN5aCRnyr3MJojgkFyazUCpA9247TbNgghKFL7hqo8zijDHpk58hzLaKv54uuIasti2x
	vK6ZnxI9gxMqDrHxWMhs8CDU9ayiiGB7r7MS8YzG0KW+VZVQb6yOgGRfOgz65IiN0zsyKTVolS3
	kijVqSj5Bd0oS/yXMVexD0HXFZ/vJ1PnCLMxVHquyMQV1XRvXGsBIET7ATxfjj+zxZ8BbnpkZrI
	uNKl0cwXCAmuUieF9ozBxa5RWkacS7Cu2+ze07RdDrYRV20WhZYXWgU/+ojYJzWHTRVBu4rMWZ8
	GNiZdyHVVK/t13gNWmuuQhI3Vl70oNmqdS054gPnPznPmC7ggHswr2q4b0uZ5T2/8XcRf3UV+af
	rutBXwawFEkB/Fx35pzQu2pYOpfvGqX3BvD76QnOJzM+cS3C/O/zBpYJKMA/ON8y5fQwHWgQ8Wl
	LeBJ81Z2eP2JweixLVNtWqtOn5W7BEhrOx1HzGlzH6/w==
X-Received: by 2002:a05:7301:d198:b0:360:db68:3264 with SMTP id 5a478bee46e88-36a42340756mr15320792eec.6.1793610855684;
        Mon, 02 Nov 2026 01:14:15 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.212])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a6f7f9sm41886949eec.25.2026.11.02.01.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:14:15 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>
Cc: Conall O'Griofa <conall.ogriofa@amd.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	stable@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] iio: adc: xilinx-ams: fix out-of-bounds accesses when parsing channels
Date: Mon,  2 Nov 2026 14:44:08 +0530
Message-ID: <20261102091408.246416-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <108cf042-5f7f-4b1e-9656-3193744e8043@amd.com>
References: <20261023185652.195025-1-kapoorarnav43@gmail.com> <108cf042-5f7f-4b1e-9656-3193744e8043@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_011418_540671_50905546 
X-CRM114-Status: GOOD (  14.05  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 02, 2026 at 12:41:59PM +0530, Sai Krishna Potthuri wrote:
> ams_init_module() already copies ams_pl_channels[0..9] as the 10 fixed
> channels. Inside ams_get_ext_chan(), since ext_chan = reg - 20, DT
> entries with reg = 20..29 map to the same entries and it create
> duplicates.
>
> DT binding requires update to allow 30..50 for external channels. This
> gives a maximum of 10 fixed + 21 external = 31 PL channels, matching
> ARRAY_SIZE(ams_pl_channels).
> Please let us know if you plan to include the binding change, otherwise,
> we can handle it separately.

Thanks for the review, you're right. Channels 20 to 29 are the fixed
ones in the binding's own table, so a node for any of them only adds a
duplicate, and that is also where the extra 10 channels in my overflow
came from.

I'll include the binding change. v3 will be a two-patch series: the
binding limited to channel@30..50 with your Suggested-by, and the driver
only accepting 30 to 50, keeping the capacity checks from v2 so a device
tree that repeats a reg value can't overflow the buffer either.

Thanks,
Arnav

