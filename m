Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6A9606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 17:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xpRdhhxU;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=iRmRRjfQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=xNCuizie4/rA3iBJi7WKXbiS7VvUpnFkAzErMyUnySM=; b=xpRdhhxU0ulvAGunpso0WbKTSE
	B8Fcmtp8qa+1Z7fmKMQ04b1YAAGkfUQ6KFURtOaFzIDsDGbhdDANfXk5F5Hh/cJZzvgr1nW3fHIMl
	uxzgKe0VWriKMRTu/EOYreiLv5RjpQZQfS0PtsK3ODlyFvNB2r34xauvsPXHdkGBAU0xwcm6dOkoa
	Ad6d6YV5koNxhESXwWCoVd7+quE5yGRkYySFxXg2nCEQ3U/CtJ+cC7SHwoeLMQ0F4ZYXy21ZDHwCg
	uGdx5nCK5TsYoNZuDYWF8h/jbKoZMaA7JRZ7mIImRYjiOIwXR+0li85Sn52qtpyF/68yK045O+JUe
	kk00wcOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMqGC-0000000CDlU-1fd2;
	Fri, 30 Oct 2026 17:19:24 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMqG9-0000000CDjK-35qy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 17:19:23 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4a2d6cf958bso5076025e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 10:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793380759; x=1793985559; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xNCuizie4/rA3iBJi7WKXbiS7VvUpnFkAzErMyUnySM=;
        b=iRmRRjfQB0/gIcaCfhFY4O91RF9oJ0bmOuqC9VC6YIzRt0H70PcEIM6IUF6ob4d/E2
         03hc7L8Qvv2Np/8vTPfJybfqeIaB+ACBqywgmvhzZDqV4RO5ANL1pbezzYnU+9qykVF4
         hxpkdkTPLm6gWHz/f0lY9imP8xl09dMN36/HY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793380759; x=1793985559;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xNCuizie4/rA3iBJi7WKXbiS7VvUpnFkAzErMyUnySM=;
        b=DNk1oZdXZabbjpHGAUZSSZ4rviUDlWu1eJaPQ2SsTRhFx2qPLQffCl+0cKSNWrj2KD
         80dqmFAxWgT/lBUZSiiH5l5Q8iipvOX/k3ccDqH+GXuiYZsFAzHzrogqGkrTnqcXYNQQ
         kBt7ndzvKug4neRh02eY7UpH40tlklmabbrNzOgpoehrBEYtvpaXPPmQrl2so2JsJmVM
         WxoTqz/9xAtigcfVbIFwbkIxbakZKtbKNVb2ExhPcz/Puwm3mDMCXzKo/CADNKlgcmfl
         j05ahWKr6SF8a2DiH+ZWt8Q4JuqzbLEmmD5yB0UkGHQRuqLy/VpcHrPXpLtA62slSRxG
         b9Eg==
X-Forwarded-Encrypted: i=1; AKwUvBwlkz9lSXWMvtBr58tJjczn/pe4CqCG+koiVXRavnHShRSTAzTibpXWW7dfGct8ZCyfrpF+F8NbBXwDXNtoJrvl@lists.infradead.org
X-Gm-Message-State: AFq9FYIV0VPQ0YRIQtKwpObSZBcVmCTUm1aquzglptsr48XNwXNHP8Jh
	KKvSIJCpP18VYj46bhWyP43wl1aJvyh3KvoLXIQNl3Dh0es+fzoVXdSWTNKSo7Y2jdI=
X-Gm-Gg: AYBFou3PwXotYq9lb9QougtBw3+ltmw1RXUjicH/dVOyu/Z43V3cGzN3uURPDg6kJe1
	jAtUF004Qq5wv21NsmdIui0s/k8tQF7wa89dgp95rj2daA1W1C+dnP5bl4M8DQD35aPeDwe3MvK
	pz0WSr4KI/y//7BG11JNIYlcY0dle6xrDGE68ytyVsEMys+IaAtqhrHnYY9pp5NS7o8d/SSJ+Kg
	muK7Wo9m0Vo/RGnQj1D8e1A0k4HycHz397spIgfHt/vO45DkT0e9ylrnH9Bfz4f3teG0YPEw6Pz
	d2MONUWYy1+Tn40NEYVicw+w/Mf30OnxooA4jbqwXy441HmyAfTRtIvcrL3RRHPUBoiYrdEuHS5
	DsC9tBjlhYFfXvffKjfgXQWb9U93qgoHwjuCG/lVXTy6Ddy0Bi2x9O9dHR8Vl/QsILkHSTXjKbU
	NWA5CAAX4Gz7P3I/LGJEFb/CKb0pn7WDcnjdJaao6quR+fyMo17YU1swXn4Q/5RCXBKOs2QoKMZ
	K0u4Kw9XbXfIaTC8mvmTFb5SB4bKTTefBzPNrhcSAoKZjz9+i8hnOgOSh31vuL+lTBfPvOEpWGm
	cb8rYmdsc6Bxu4ldDb1ZHH/ZbPL5z4cJsahG1cRv8gwBHjQBdwk5IsGbFe28u/3CcmA1yl7GAJX
	vHsg5KCvDVOjSucVU/niWn7w53FbUA5VKBB7WWCTPK8q8pxODeKv1RLBX108uipx/Qx5HWQXHgj
	dHYSdKrNLwbE7NB4YA7Sm/HnHNTw==
X-Received: by 2002:a05:600c:c4b8:b0:4a0:1b14:e283 with SMTP id 5b1f17b1804b1-4ac150b38dbmr70600135e9.1.1793380759329;
        Fri, 30 Oct 2026 10:19:19 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf368bff7sm74252355e9.2.2026.10.30.10.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 10:19:18 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: dario.binacchi@amarulasolutions.com,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Christian Loehle <christian.loehle@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-pm@vger.kernel.org,
	coresight@lists.linaro.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	regressions@lists.linux.dev
Subject: [REGRESSION] cpuidle: psci: boot stall/hang on i.MX8MP
Date: Fri, 30 Oct 2026 18:19:09 +0100
Message-ID: <20261030171910.2822677-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_101921_797534_83C123C5 
X-CRM114-Status: UNSURE (   9.23  )
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
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Ulf,

on an i.MX8M Plus Dual board (Engicam i.Core MX8M Plus), mainline
c339f4010dea sometimes stalls for ~0.9 s at boot, or hangs until the
watchdog resets the board, right after:

  [    0.806123] ledtrig-cpu: registered to indicate activity on CPUs

On a good boot the next message comes ~11 ms later.

About 1 boot out of 3 stalls or hangs. With cpuidle.off=1, or
with commit 65705b18162b ("cpuidle: psci: Move initialization a bit
earlier in the boot sequence") reverted, 10 out of 10 boots are fine.

I haven't dug into it much. The stall seems to be in
pl330_driver_init(), so my guess is that it is related to the AMBA bus
reading the ID registers of the CoreSight ETMs while a CPU is already
in cpu_pd_wait, but I may well be wrong.

Any idea?

#regzbot introduced: 65705b18162b

Thanks,
Dario

