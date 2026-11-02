Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B77606B1C9
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 16:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RIewa7vI;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=lNFAcn/P
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YKR7EhYSJfAtB2F1q2SE76iFC5+js2w0WFNuXZNhlIA=; b=RIewa7vIHO2xmX
	P9yuKUE628pnnUKMMYfumMa+RD7Wf1DMIy7QlJsk257CQh40X1zehLKdo7cPYxAdpeW5NdqwMvDbv
	8WcvXs8lCkMZ32n3wNjuC4G78kR8AaePVdrAfqXEuZ/VC8u4MR6WF9RDejewEM3AflWghMIyoN7Y0
	vifRYCmsSBiT6QFDQOx0rZ6BvKEYW18Bq7q5Xb141H/GBWMzLLwbr+ePvroGdiA4P1ey/A2w79HGj
	LfvnTLBU2yjlKgdGU1ggdz/T1vUy357alsDKymdBKLqaJmgo4R1cFtdX7xrcdardiaizUk7eIvVos
	qtBpUD0TfRqslEAVOyoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNv8S-0000000HKB3-0TKb;
	Mon, 02 Nov 2026 16:43:52 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNv8O-0000000HK9n-41Ss
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 16:43:50 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so36978845e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 08:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793637827; x=1794242627; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YKR7EhYSJfAtB2F1q2SE76iFC5+js2w0WFNuXZNhlIA=;
        b=lNFAcn/PE9zoQK8HwHf0W0xMNkOd+EvgB2VFe3wABRsYVBdIAbVGpyZ53yPbkeRsAL
         0BvG/Hs+fikwdrKNser5eE9/tas1CPjH4bN5CHF4L7T79c61dq/S/t4OpS4o5UtQFsn+
         sJeQdN0NlF+3UuLLKkglXG7taw118kN1d9+M1FtuJoUnhPDkc8i7IkyDNG5p6lVrqOAc
         zkQJKW36pwBxzldB2BwMyP0t8zk7rZaJ8rmsnOzDUyTr2hrbBT5hUEQzV4c6h2jcLxK3
         wsXltrID0v+KbMyj3S6HO+93iaB/xnFTT8CJFJKJVjNhCO+NUDz9o3Yr81LHK/H4cuJs
         uaCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793637827; x=1794242627;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YKR7EhYSJfAtB2F1q2SE76iFC5+js2w0WFNuXZNhlIA=;
        b=U8071DNs8DFS2xzdCrCyY+ZTSYLTvpCMtCVioQB28Z+UihyqbLQ5Sb/fbyQsjpymu+
         7ARH2LS1zHOeNdcAM9pRJLYQtDjZodVXU/obRoZtPGCK1cy7qqHcEPvCQrY0yztIDR4/
         38i0foK4YB5Peaqzo74BrK1NKdArGkuUS33ZfqVYZNpSX2qyclSjdvSgVEJ+fBvExaw7
         jqxthNKWqNp1x/GKKoGE5/KLVC51TjL9QnHVlIQar8p0GrG1c2VfTarO832ykA7BFUIl
         B4mFYawPxuSfm5rHL6liIAbqaQSuJiWzy4aDTVsISfoF+2glYa3ZJXut/55rzGNDaMSt
         XWsg==
X-Forwarded-Encrypted: i=1; AKwUvByqT921jnZedRC6ki30eljwsJJTm1V6QeetdvX9nKmsW2tC4bKl4ZcabSlUCNovISDeFD9qvpAnHJdOqYcllVHj@lists.infradead.org
X-Gm-Message-State: AFq9FYK2zMEXlAroVSsXJ6bmUhFVBFG63nDOC85gla970vQUdABUKvMm
	JZlX4wURLpmxPSyVwSDiNE2umlJg/E2AvsFgbERJGsa1qO2q0juUiJyIVJjvpFJ9iMI=
X-Gm-Gg: AYBFou2B8KozFupequHVSy7S0PdQtthviVEFJE8hNZYEaYRiSRxP+CaQ04WRehqZJ2L
	RG7Hp87qmkLWJoq3C3kWdkU9xMduK8h5tH0CftF9tSun7IZoAi0luR/8M/NeTOqn3iCEYJ7wlRj
	mr82nAsxMQ+mAhhf9KHdWhxJd2K/u3VCGtGbIsHbpa5lPjkSZI8yTvgEU6StnN4eiSM2vRc2Ld+
	1izwxfiWezhfIFnJJ4wJ4om0MpNlZob9Ksl3O0+Ww3aeG3m1t4EwT2RSb/j/GY4RdOJn4XoSEIh
	uSz5D5mL8yqsLdEs/eP2ln/2l6gAW32SfzImx3+6cw0vqPZI0Re5FdTWY/O62MWeAT68lzTGhD2
	VIGBAo0ZuYBRBUxie5cxBOEEIOhOM/1HgoQf9YPDsSUy32xFtqFcwTILKT1K5gdOFa6UB4QWg8U
	wPIA9w59GSZe5tFsZfVcnieY5qgui56H5Yn4+yn5Cp2GKLkpPbp8aTsyFH9W/pDyZBVl1RJH4Ip
	XycZlen1tGhekQ2bpS35wzUCUuylJpopqoaa3cbx9a6pCHqkuLBeJxwPM6Gu1umd4LybQuu++rf
	YzkkPclA6R6GCVJmlaAvjTDW2aCx9OfEr2E7sFQfCB20nahR4nIaSA==
X-Received: by 2002:a05:600c:1f93:b0:4a5:75d2:c104 with SMTP id 5b1f17b1804b1-4ac17ffa050mr255111425e9.22.1793637826920;
        Mon, 02 Nov 2026 08:43:46 -0800 (PST)
Received: from jarvis.. (82-230-44-19.subs.proxad.net. [82.230.44.19])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e71bae0f4sm18537611f8f.58.2026.11.02.08.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 08:43:46 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
To: rtx4060@gmail.com
Cc: broonie@kernel.org,
	lgirdwood@gmail.com,
	angelogioacchino.delregno@collabora.com,
	matthias.bgg@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 0/2] regulator: mt6363: Fix the regmap value width and the VSRAM LDO registers
Date: Mon,  2 Nov 2026 16:43:45 +0000
Message-ID: <20261102164345.523122-1-amergnat@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261101164405.1743177-1-rtx4060@gmail.com>
References: <20261101164405.1743177-1-rtx4060@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_084349_001119_34DCC4FC 
X-CRM114-Status: GOOD (  12.38  )
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
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Gibeom,

Thanks for looking into this driver!

On Mon, Nov 02, 2026 at 01:44:02AM +0900, GIBEOM LEE (이기범) wrote:
>  - 16 of the 33 checks of the model fail before and pass after. The 9 that
>    still fail are about the VEMC voltage callbacks and the overcurrent
>    handling, for which I have fixes that I would like to test first.

I happened to have a fix for the VEMC voltage callbacks as well, and I
just posted it on top of my regmap patch:
https://lore.kernel.org/all/20261102-rgp-67-mt6363-regulator-fixes-v1-2-420789a3113e@baylibre.com/

It fixes the range lookup of the getter and selects the trap 0 or trap 1
registers at probe. Could you check it against the VEMC failures of your
model? If it covers them, it may save you some work on your own fix. I
have nothing for the overcurrent handling, so that part is all yours.

