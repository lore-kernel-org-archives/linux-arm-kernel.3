Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A25606A338
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 12:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BObds2zv;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rJnU6frW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=95uUhBzkqd0S8bWXX7KO834Szjb+muDQfNOhhj7jIow=; b=BObds2zvvSP0FGPHGZGsEhSZWi
	cHGdysj0jmDDGVmCp4ll8fwJ1tXrGkrWlUsw4iL1MwhUlcfVoZcCQfs3EwCUYOAs0CXO7W72Ia54i
	SzSvAfsIF6X3GmPKKFn3Xcc0oGGOZNNa7x/ylIVYbygwl/iLb7wUc5BuSW4uVNrhXAzP1vuLzJNem
	mYd/6JVxmdA+ubV/b1U/knpfb18DovKn0okjSbWhnDH3ih9pcTf6z8ZMECvDLss7FC/BpXDF5Eepe
	LGMJvogM3n13s69bBGZTM6ZO1ANwma78KWh6wtmzdcZS6B2kd63ChLa6utdLj5f0dPct8YM9wp7tp
	WJVe8gVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOaS6-00000005OE5-0cuF;
	Wed, 04 Nov 2026 12:50:54 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOaRr-00000005Nua-15HX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 12:50:42 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-cdb1199bfd8so304081a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 04:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793796638; x=1794401438; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=95uUhBzkqd0S8bWXX7KO834Szjb+muDQfNOhhj7jIow=;
        b=rJnU6frWo9jevCAb368SXcebK90RvCtG/lV3aHkelTlRKXyJAxeK9dmBTzG/ZwzfSI
         31pl/m6lKAedRHlpTxJvkvHwLpNKC6aAQiYsshqMMm+//8iJVYTh2Vn5QXNKalyFiww2
         7tuh3eURsKXsSrk4PbPsbROex6BYvwMibpF4/yXvDQAW/234ZJcieV7+BkUrBsLAJ/qE
         7QhPgqwOQw/P0NeRa4Fu27yKuAbBbOmPOXeIkAw9OkwRNWlN/QlWxGC9rKJp+O1xj+33
         ZqS/FCS+vX8yMvhDz5JIDIJrJoX9ke6hLCWrvSl9Zsda9HwNVtDzGWIt9JCeZtGkVWFS
         VTog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793796638; x=1794401438;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=95uUhBzkqd0S8bWXX7KO834Szjb+muDQfNOhhj7jIow=;
        b=CR9XyG7o46S8PGk9C7e16DjrWtcjW31xk/DFw2amRYy7c0KW3jBe1Dwsq0JpEQemiz
         D+iIut0rxihXSxxnbj6gQYtBG53u7hqcIfonT+y/qxZtCXoU9tewk1i8Mkzdn8Mh3mr2
         4BfyV5tGrrVrWGSJZBEIo+Q0WLQI27lRyTZ/uHKQybiV82OROk+TBexpTrgIbhjqOGAc
         RriGK9zJbqk1aDE53j6E+/Y2nfM2HMdeWGQMXO1a07ivUCn+fJ2vLqcIThN3TR5CMG7C
         9OVC2Yn4b41j3DQI+AYyl1kbW/0LHx47z7cc6FtERsk0mMkiAhFQFicnr96AUt4rV5MW
         6ZPQ==
X-Forwarded-Encrypted: i=1; AKwUvByHl7ol/qy4kbU05NXWMob7Tul2xeS6vHF3bQKhJBGRIJB1ZdOZ8LdpmMnjzMftciWYcBEz+oiUdyFYlrwT9l0t@lists.infradead.org
X-Gm-Message-State: APuU4Z+lbjPzsRO07jO3EO7e/jdQAH7ar1TBmlH+c0I8iaRVHLL+hxgI
	jFDtxazJdpfA1WRjtkyeVguBzJV+T7DqK2W7qry6+9/zH87kAgXbN0pA
X-Gm-Gg: AYBFou2+A23S+GUoM71/zcIQGqIahfEPC9e/cgewZ/RVDRZmkQP2BAilTDZP+YekYAC
	mHCjeD0P+yjNq3TJswVtudr1HIHp29dnlnbYHHHUJlqMFZDY4JDb5fi2C7GBbeLd0s1bvlXHdwG
	AfyPw7oGXRo7Kpj09ZdmXJSwMsjgxJSr5PVMo9G8Be+ULJF/xdL64/elwDTfVrVgQ/rdKvb/T2Y
	oDNbFVPvDDjolQjk+SwTJeNJNO98G89Z1Pf+Y98gZepq6c1d05VZBSMp1ql2YC7/g04K8mHhVHY
	SIoBI8qe70pfw+Ib1Lrim700DtYhFr7zC7tlU+z4Is0Bnhpt7U99kBvuIULfDzTK6NqHhR4IHD4
	4lBBHULdNuFXNtWgJZDHI/wroCScSro4uWlE2ZQiOVeAp+mO6Fg6PodpwYfcCOnQAp2JhoYyQAl
	vxeCsz7ZF0RTRMqB05eMGbpWJEQfV1pRLS+O6HnntfQ4CoNcweapbE5ngsoktl/d0VqDSVN+dFX
	0JnsFd2J5KVoukZn3hW8w5yOWWqc7HbKftmo9PTWMYaoHvjBDWo8/21vCASVQQXeQ/32K6enwTw
	O/p22zcogWYaXv9my8sn8GLtVikVCCXrlYoUacVdcwvIoTHa7A==
X-Received: by 2002:a17:90b:4c52:b0:3ab:1481:69e5 with SMTP id 98e67ed59e1d1-3ae897ccbfdmr13704451a91.11.1793796638093;
        Wed, 04 Nov 2026 04:50:38 -0800 (PST)
Received: from server227.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b09449bff2sm3920799a91.9.2026.11.04.04.50.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:50:37 -0800 (PST)
From: Zxyan Zhu <zxyan0222@gmail.com>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	maxime.chevallier@bootlin.com
Cc: mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	richardcochran@gmail.com,
	muhammad.nazim.amirul.nazle.asmade@altera.com,
	rohan.g.thomas@altera.com,
	o.rempel@pengutronix.de,
	wojciech.drewek@intel.com,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v9 0/3] net: stmmac: dwxgmac2: timestamp interrupt support + Agilex5 fix
Date: Wed,  4 Nov 2026 20:50:27 +0800
Message-Id: <20261104125030.1183146-1-zxyan0222@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_045039_314015_A3EB2341 
X-CRM114-Status: GOOD (  11.13  )
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

This series adds auxiliary snapshot (EXTTS) interrupt support to
DWXGMAC2/DWXLGMAC2, fixes a stale TSIS race on the Agilex5
cross-timestamp path that the new handler would otherwise expose, and
guards the shared aux snapshot handler against a zero channel mask.

Patch 1 makes smtg_crosststamp() complete on the persistent ATSNS
count instead of the transient TSIS bit, waits for the FIFO clear to
complete, and holds aux_ts_lock across the whole trigger/poll/drain
sequence so a concurrent EXTTS request cannot flush the snapshot FIFO
mid-flight.

Patch 2 guards the shared aux snapshot handler against a zero channel
mask: ilog2() is applied to the mask without a zero check, and
ilog2(0) yields an out-of-range event index that ptp_clock_event()
feeds to test_bit() unchecked from hard IRQ context.

Patch 3 adds a dedicated DWXGMAC2 timestamp interrupt handler.  The
XGMAC hwif entries used the generic ops, whose callback read the wrong
register and whose enable mask omitted the timestamp interrupt, so the
clock advertised the aux snapshot channels but no event was ever
delivered.  XGMAC_TSIE is not enabled by default; it is armed on demand
from the EXTTS enable/disable path through a new callback, and the
handler only touches the FIFO while the interrupt is armed and while no
cross-timestamp owns it.  The interrupt is disarmed on suspend and
unregister and re-armed on resume.

---

v1: https://lore.kernel.org/netdev/20260806-dwxgmac2-timestamp-irq-v1-1-c051c79c9d90@gmail.com/
v2: https://lore.kernel.org/netdev/20260810100221.9166-1-zxyan0222@gmail.com/
v3: https://lore.kernel.org/netdev/20260818132722.1852876-1-zxyan0222@gmail.com/
v4: https://lore.kernel.org/netdev/20260902131441.322167-1-zxyan0222@gmail.com/
v5: https://lore.kernel.org/netdev/20260910081020.86227-1-zxyan0222@gmail.com/
v6: https://lore.kernel.org/netdev/20260929073553.4136336-1-zxyan0222@gmail.com/
v7: https://lore.kernel.org/netdev/20261004120526.2728564-1-zxyan0222@gmail.com/
v8: https://lore.kernel.org/netdev/20261013033207.1684328-1-zxyan0222@gmail.com/

v9:
- Check the already-enabled channel from the live PTP_ACR mask before
  programming it, so an enable for a channel other than the armed one
  is rejected with -EBUSY while a disable for a channel other than the
  armed one stays a no-op, and re-enabling the armed channel stays
  idempotent, disarming and draining the interrupt across the FIFO
  clear like a first enable.  Requests are also refused while an
  internal cross-timestamp owns the FIFO.
- Move the smtg_crosststamp() EXTTS check under aux_ts_lock so it
  cannot race a concurrent enable, and hold the lock across the SMTG
  register reads so a concurrent PTP_SYS_OFFSET_PRECISE cannot
  retrigger the snapshot while they run.
- Hold aux_ts_lock across the whole of intel_crosststamp() as well,
  refuse to run once the clock has been invalidated by unregister,
  handle an interrupted wait, and disarm the internal snapshot trigger
  in both cross-timestamp paths on the way out, including the error
  paths.  Drop the recorded EXTTS channel in the resume-failure
  teardown and at PTP clock unregister, on every core, disarming
  PTP_ACR or PTP_TCR as the core requires, so a leftover or re-armed
  trigger bit cannot reject later requests.

-- 
2.43.0


