Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF452C9832F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 14:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iXUCUjq71+8k3taqxC+i/sW2l2F2mupWy1EdJWtMaQE=; b=yjDKkzSAnnOxcVNvttTHzIg4RR
	Ow6Pl2YC6E6tVW7pnjvN7n4BtGmZ5kgA2jC1O1hwjTUXovt9uXNRvvym0/9bt2T2NJUbx8CnUVSPv
	GACcxywhFwOvrgXtxh/mgiUSkHvyMC/cze2Tw1x1ai2ZGoKliie8qDf1oDAkkEKD6hZGjhVtjuAcT
	3pw04QC6Oeg/1f+qWCSuEj5HjqcdpPE0EcmXn76xh+xDuo4mLRixlqx157xMU46w1SZ7HHUCTny/3
	OyUksfCrl+JlNQrRvNX072/icZvGrUsG4XOINpZVV3VEcOxyiBk5JCo2BmLPGfH9WKZlGwcEbY9Sy
	fRdxlkJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAqIR-0000000GTGS-1Tp8;
	Sun, 27 Sep 2026 14:56:07 +0000
Received: from ci-2003f-snip6-11.eps.apple.com ([2a01:b747:3005:200::3f] helo=outbound.ci.icloud.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAqIO-0000000GTEk-2V9h
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 14:56:06 +0000
Received: from outbound.ci.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-central-1k-60-percent-7 (Postfix) with ESMTPS id 9394E180105E;
	Sun, 27 Sep 2026 14:55:57 +0000 (UTC)
X-ICL-RepId: 01a0e35d-9a6b-732f-afee-2f344ed13100
X-ICL-Out-Info: HUtFAUMEWwJACUgATUQeDx5WFlZNRAJCTQhPAEMGXAVeC1YBXwFLVxQEDloDVA5cBBcbXwJCH1sVSzhaDlsERxQXG1wAFw1WTVAbXwJCDxwTVhUTH1RWA0gZEFYBWFZdBU0aXBhZDxwTUFZaDlsERxQXG1wAFxtGAgQjAl8ARQJeCVYBMBcPVk1QG18CQg8cE1YVEwBeDw9MC0gBWwdSAEcITAZYBFMcQgpLBlkPRgNdTxFdDlIFRl5aFFwYQwJXAnkRUAFYHlZeWhdeUxcfSwBcRVoOWwRHFA==
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1790520959; x=1793112959; bh=iXUCUjq71+8k3taqxC+i/sW2l2F2mupWy1EdJWtMaQE=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=KmaWwe5RpfruJNaObUnI0NbRqrwznM62sd6vJHfRWnK0CPG3vDc0fzlYuzApv0CdUCgxrLwY9BZqhGZALGM472rLEP4djyKuRzWqsWxlQcXmTb3IzCWLUk3sk6ztVnHB01/5XxjQKJsU+/9O94lYqQS92kPljcnvYLTfGN1J93Ht6fm982CnZWM4608sKFbM0JUgEoETSNY2YcmtHAcWEbKLYQCyuzxQCR0gyGJpbN14y3SnjT7cei5UZDR46srvaolgUjI/ILvfHP2pcpsqfKR8oYY3uwbyGawpmBfxcB3D+krU2SZ/CmGo+j8KGXzdOkXEkQb72sDjaSFlLUp8/Q==
Received: from bigre.tail98293.ts.net (unknown [17.57.156.36])
	by p00-icloudmta-asmtp-us-central-1k-60-percent-7 (Postfix) with ESMTPSA id 469461800629;
	Sun, 27 Sep 2026 14:55:56 +0000 (UTC)
From: Vincent Cloutier <vincent.cloutier@icloud.com>
To: sre@kernel.org
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	daniel.baluta@nxp.com,
	shawnguo@kernel.org,
	agx@sigxcpu.org,
	angus@akkea.ca,
	Vincent Cloutier <vincent@cloutier.co>
Subject: [PATCH v1 0/4] power: supply: bq25890: add input voltage limit
Date: Sun, 27 Sep 2026 10:55:34 -0400
Message-ID: <20260927145538.233548-1-vincent.cloutier@icloud.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Info-Out: v=2.4 cv=SMBPlevH c=1 sm=1 tr=0 ts=6ab92e7e
 cx=c_apl:c_pps:t_out a=2G65uMN5HjSv0sBfM2Yj2w==:117
 a=2G65uMN5HjSv0sBfM2Yj2w==:17 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10
 a=5j__JWfIoqoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=_-FhWcXjAAAA:8
 a=7kaDOHpzh_6BBANZ6oEA:9 a=c3Bybt16QQbktBXcOhN1:22
X-Proofpoint-GUID: -Mx4m7wrWKjDpt2pbCTiVoBYco1bWvGm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI3MDA1OSBTYWx0ZWRfX7mfTiPcpoSlj
 M2sJD3G7ChBIa8sHb42EIt/+X1yhSqbo1xvXQ4IUf8ndMx1omETwV1i0WeYL7V46xJtwFhXozbN
 Ukmvn0WtWMTQb98iYYxH0RO2/YrPzup5bxhkNz1JQWSaBOrJAfgLw5sA6qXejrk9YLQeeccAFCl
 cbg9NU3mFSctzzizX3Y7xjz+kXlo4pcQzAerGDzMrv0kVyatjWvxTj7+q2/n0ElBVEQIgwyOynp
 yhclHJw0VpCE143lHxYp+HNDUzvtf6VolsRzQNLxXAlzCP9XU97CO96rvWMm+fqHLc6Wp4dL7fT
 uJuIR2KWT40j6h7LGaoh1MEhDIIyXKFwy9rcrFKQju0BkgFDL3IlIkewJs+pws=
X-Proofpoint-ORIG-GUID: -Mx4m7wrWKjDpt2pbCTiVoBYco1bWvGm
X-JNJ: AAAAAAABQw24dVJiFzThQi34z3rbhBNnEcPJAhQ45L8T+fS+9nssl2H7kwZydwd3bafYhvqfaPDwI4AxCYqpU2SnfoqCbyHJ4yXC9eeN13HrQspPwglQ7TDQmIlkUSpXTInv3FbIg0NAwwyWgsbqgMjjEyCIrJqdjHrd17upC/uVeaZDMAz6p30s4T5RLzgML/FGedhXGr9MMj787OlD6vA/PWUSTbW+7zXUQleVPZpyqitC8ER9JlOzYE250ncL4WiiwAdEjVo9PVRMa301XD2nV3wr7HEBO7G5NJ09p2WJRahQskCIHVoMnsbMRMWwFEIxLwOsOeJQK/+pzGJR+pKPLJprZFR7Oh5un4RZeMbQknzRvJoGcMnBpp1F3v8wnQN3OxyvBx5QInb1jL+37hH7Ey4KhGC3eEVuvar4FXcyYaxcvm2Uh3Jqse/NKlupDv5Hxq4a+ngiSHJwebd8Bk3igbsq3scmpS6X0MhUthPNEOmiezp8BY4PBe08WutiszUsPvLwBOyKcPU9VhVco3UFfmSnTUodMe3WqtIW2QfEEEqDmyDhf2GpaKbVGH7AjOl97KqrS+YIWKJR1bILbQ1+2ID2cQ2+W8jEEgA4RFZdRrhjdvb0o9dYk33WHBmJFgHEkQj+7epzkQvfJNJ9xi2fkYnaEs0ZXR6UHraHcffGk0HUTIBNAtZLziwTRJcHCrLBuzrcz2UaeEWkwcxajwYUzxldBEXW8Z61UH7o2J3izNk2ki/umX+ckA+PNcwSHUFfmNmrfR9umMlDRtvyNP9Qw5DtYOO+EBBuLRAcubbdRzZKomxwAENTdU5Cg2p36L6mrTr0ui6OZpS20uv2Hvqmw8XMDe/ZLGG0o0lrOfP3B591olpkrfn8J47otG9CwjTEJAhgyqQa4aFTCQ16j1a4wonzZqGdYdigfxCTe/3NxmtWDsLi7gJs04SAT9EEHZgkeT3Heb18pFW13sQ0tql0W4+ISmO
 qliMjo4qopqAYGfztr3Z4W6/1AnG3DJc7Lg+0z34IOJPxjQGXhQRj71cvMsPjjdYbDPPzvottx6wC9qO0hjsBPi0QQNRuBDfY2/5COguft5OrORnc0Iw+lKFzMhVMoQ+ffe/pkHcdNv0nUqLPh3v+hkE7KZbG/r2LmDcUCDvYxNJbIclRL0y54NR8HLCy9FsHkOF2D3UAZiZdGx9Wwjrv5uQYnkCQ99IWeEBUOFblCGd1M+mtj5S9hxa8WnV6roAzNttSsLw7hiESAW9krAaxX2o59ILZjwCJs1KKhsNTzxN1zmaFTWOzW8ay1cIdgHQFh8YP/nTN1gheQ13ws/iucI7nHydNQR4rb7unwmWuF4PiZDNBGB/ZcxxXppkZaaGTehB++j0AylL1+93B0YW3W75Uof1VTCdr4vvvDakebKy4LEN5X8nyDMp1ht0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_075604_697102_7D9D6456 
X-CRM114-Status: GOOD (  11.96  )
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

From: Vincent Cloutier <vincent@cloutier.co>

Hi,

Add an optional input-voltage-limit-microvolt firmware property for
selecting and programming an absolute VINDPM threshold. The Librem 5 uses
a BQ25895 charger; the board patch sets the 3.9 V threshold tested on the
phone. This provides useful standalone fixed-threshold configuration.

Purism's newer charging work pairs a 4.2 V threshold with Input Current
Optimizer support to improve operation with weak sources and resistive
cables. Those changes shipped in 6.12.79pureos1 as commit 3bd0fc6da9d0
("arm64: dts: imx8mq-librem5: Bump VINDPM to 4.2V") and commit ca7bb9bc4d24
("power: supply: bq25890: Support Input Current Optimizer"), and remain in
the inspected downstream 6.18 branches. That additional optimization is
follow-up work which can build on the generic configuration added here.

The BQ25896 resets FORCE_VINDPM and VINDPM when an input source is
inserted. Its source-detection and VINDPM-selection stages generate
separate interrupts, so the driver compares both fields with the requested
values whenever the charger is online, before returning for unchanged
charger state. It repeats the comparison during resume in case an input
insertion occurred while suspended. Registers are written only on a
mismatch, avoiding an interrupt loop. Successful restoration is reported as
a handled interrupt even when the tracked state is unchanged, without a
redundant power-supply change notification.

VINDPM programming and restoration require the explicit voltage-limit
property. linux,read-back-settings continues to bypass initialization
properties and does not enable restoration of a firmware-set threshold.

The binding and driver changes revisit this 2019 posting:
https://lore.kernel.org/all/20190520180712.32405-1-angus@akkea.ca/

This version addresses that review by using one property. Its presence
selects absolute VINDPM without supplying a default. The earlier review
suggested input-voltage-min-microvolt; the current bq256xx and sgm41542
bindings instead use input-voltage-limit-microvolt.

Patch 1 removes the invalid monitored-battery reference from the same
charger node. This cleanup is independent and can be applied separately.
It retains Angus Ainslie's original authorship and sign-off and adds my
submitter sign-off. Patches 2 through 4 are authored by me.

The series passes a focused arm64 W=1 driver build, BQ25890 binding and
example validation, Librem 5r2/r3/r4 DTB builds, and targeted CHECK_DTBS=y.
Host-side register-mock tests of the driver functions verify opt-in
behavior through initialization, online IRQ handling, and resume,
including read-back configurations with firmware-set absolute VINDPM.
They also check IRQ results, notification counts, and register I/O failures.
Earlier Librem 5r4 testing validated the property and BQ25895 board
setting: REG0D remained 0x8d on an attached boot, unplug, and flipped
replug. This validates initial BQ25895 programming and retention, but
cannot exercise the BQ25896 input-insertion restoration path. No BQ25896
hardware was available to test that path.

Angus Ainslie (Purism) (1):
  arm64: dts: imx8mq-librem5: Remove invalid monitored-battery

Vincent Cloutier (3):
  dt-bindings: power: supply: bq25890: Add input voltage limit
  power: supply: bq25890: Add input voltage limit
  arm64: dts: imx8mq-librem5: Set BQ25895 input voltage limit

 .../devicetree/bindings/power/supply/bq25890.yaml  |  9 +++
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi  |  2 +-
 drivers/power/supply/bq25890_charger.c             | 74 +++++++++++++++++++++-
 3 files changed, 83 insertions(+), 2 deletions(-)


base-commit: 4477a78374a57c3809b172ad30cceabda48c47c6
-- 
2.55.0

