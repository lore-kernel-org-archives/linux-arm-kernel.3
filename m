Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A4B606D808
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 11:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1zzO1StT;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=Ut82NeAj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=odSicPyBiWMeXwZS5CSYi6jj9nkBSENVvEsTlEm5dVc=; b=1zzO1StT0XZrZF
	yToQVrr4rddzZXI+g280T04pp8uCvqjVnhCmeiDqEVAE0JAZhiBZUMB+QkaqVQ18eRfR+4u9Ixl2/
	FP99OkGMbk3VF40Splx08do1Qo4SfOZ7kDkP8WRQGL/cJgjkn+b8hn8l1+ke3TKfbJ6psOLQZ0VSw
	PZr+aTLglQOqipCVT9uCMH4tqP11SAtCN1Mvq3ys1t1cbHNZ3dtAS3RgjTu9G62gUbHx9AeZDDtcM
	79mVF6n81b395AiV1ORvcpekNK+DX6hSPZ9e9K0CPgBdBvDHEjbC8wexhx5fgVynX9/r8DHO4F+k2
	uDUIKvtkEHctw6DlX3gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHuy-0000000C7Dx-0c8Q;
	Fri, 06 Nov 2026 11:15:36 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPHuw-0000000C7CV-0fFu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 11:15:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rKJLMVXn9zrNUmQMaqyBCUOalhv281Xl2RQN8+fzKge/tBYFL/qoPwkGfJOC/1hGJzUybCshHO+h8DCYMgLGlf6mSJ2yP72NO1nP4aAIYyeA8gsT++th3NasYT8dT6Bx9LQALi8avJf5JNnNjVevGUa/E2YF0+VR5QRSzbvhysdvlXoyCPR/c45PUpPQ42M0Wdoqpog7WwsKlulHQdzY9z+disTyyJOPG+oeI39K2IBZXmwle1QpblXWvWqJAoAFmm8LkuNsaGPWVWkypOIxzwqH0i6BQ0lwzjTH3pvdFjtvhhw05s+NaZqv599yG3/VGlfkAp5oBiu+Cks+nSirMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=odSicPyBiWMeXwZS5CSYi6jj9nkBSENVvEsTlEm5dVc=;
 b=EH/XG/6nv5YK2M5iwJ6FOHKeDyWDEsQsWw4mA3A1uZiY1WhmPbYtunLeDD0HTNlpuWqSz5+slpF4iD40tAqIY93bSppQXJ53Z8lUH3EIHEuqruSG/AN2XojT/1fLB3g8Ibjo/tlUQ5X/lOqzbOs2+xSfPBNDwg0+peets1kxP1pzgghPGf9ucTIulYWOZIVN3vjf7iYzudL9+lX4veyGXlSC2D5Kp3++dvanVSVmTKhEXwUTY4ESXkhM2+D2cOk0AVt+XLflXcsv87YaYo5EP5WJujbgpKFa50yYG71GI+KjcFTA1KEGdnl/CnkJL9cNW3zz3/yadCEbpF4xjty0LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=odSicPyBiWMeXwZS5CSYi6jj9nkBSENVvEsTlEm5dVc=;
 b=Ut82NeAjhgKv1n3cOvAnRv33CjUmfPRb3sbgJ7QWwio10AWkMqNxi3EbieeDR4aYPUF8AKO/gwTQEPatuRK8K6H+Phk41HhPKc4jpLlrwOdA4e3pII20bHc+D7nm0tfPkipJWEIKnqM3yMn93AfY/7RAAT2+N79ByQv2QLed4nwdbvD5Td19YjHGFtLwcnx9cUpIcv1uYn7059GQOjy8BmQvpcoD0fhh2Kjc84Yo6pAmvnedzYWajB0RrTzugBkP0qzH7FbcfXrvv7A47RyILg8lpHN2EI8BfRqBFRMClZybByhsmb0ILvzsYJYUxSzAhUN7eum660kD11lkls3OZQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by AM0PR04MB12035.eurprd04.prod.outlook.com (2603:10a6:20b:73f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 6 Nov
 2026 11:15:29 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%3]) with mapi id 15.21.0592.009; Fri, 6 Nov 2026
 11:15:29 +0000
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: Thinh.Nguyen@synopsys.com,
	gregkh@linuxfoundation.org
Cc: Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jun.li@nxp.com
Subject: [PATCH 1/2] usb: dwc3: wait for the port to leave RxDetect before xHCI reset
Date: Fri,  6 Nov 2026 19:19:42 +0800
Message-Id: <20261106111943.2868733-2-xu.yang_2@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261106111943.2868733-1-xu.yang_2@oss.nxp.com>
References: <20261106111943.2868733-1-xu.yang_2@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0013.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::9) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|AM0PR04MB12035:EE_
X-MS-Office365-Filtering-Correlation-Id: cee5a055-0da7-43fb-5a9a-08df3bf743d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|23010399003|376014|366016|18002099003|22082099003|10067099003|11063799006|261102123227099003|261028144727099003|261026140227099003|261026121527099003|261021123027099003|261022075727099003|261021121427099003|261022105027099003|56012099006|261009223027099003;
X-Microsoft-Antispam-Message-Info: a3umQQfdV6/H+h5xu9F1jDN6LkJOdvMl1lSTrCFmCZI6VQXelLFDdriGtVsANcNmhC3LGqQUmwcM0J+QHhmKDF5RDqL0cnFtud3INgHxEEkxpq/81+CZ6auIN4jiF3Zj5DlJlcQNW2/kx8sn1H/pT2eJm/RNOeh4QEqq3K27m0z4Nz7rhpn5v1i7PCQ/enB0mbp+QSojhkrE5FBkY+y3UTA9LFjLhaIpN12X0yxYTfI2o8H10hGQSuXRI+IGGEj13nJG4anM5PagcmZLDuJtQNd0KkRjfkkq1GAQkvfV113/6dkUzxsoG/QvzS+IKXadgW4DJiupghe01F8/6mv0QLGfSj+UnoR+QvZMa2RHKiP3quucIYyDTetvUM1kw564WRqFXBeTspuFqnx82lRxzGmea0w5YsfGSiO99MiNBgRFpaiO7y6ccdI4kDG9U3IQ9r0jwcQj1GSt2N4ZDibmgkvvyL5mD0otjCEgdw6t+115UeQUF0ia2p4bLGNDpgOiPxzAI721fTL9x6Wwwe5KVA+SQ7lP82y8SeiyEd55uOAUgltEsJdMZeIw9co95M+sqPFe8PXK3nw/ZUxppgFFEwhPZqvPKH3FiBh91psu9YtuBl8jNJ8oSzV8pMbGW66WR7wnKrRkPB7fGmEN3fecEuOHb9O+EekgMn0wyvco1Yk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(23010399003)(376014)(366016)(18002099003)(22082099003)(10067099003)(11063799006)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(261021123027099003)(261022075727099003)(261021121427099003)(261022105027099003)(56012099006)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XYdJZzwNuG3kSQEIbB+AGU3BJuDgMHcsFVeAqlW+a0mZRLx3wYIDI5UHXBE2?=
 =?us-ascii?Q?LBbeiV0H3jFG+k+DQRuL9I9v6ADcuI5v/77ZIzxR+tGNowVoWPrsWjTDDpsj?=
 =?us-ascii?Q?mUVeOBgCX791PTSw+9IQpWYC5xiq9reN8l/FBfraxEipxXGOs2K57WHcYLS9?=
 =?us-ascii?Q?q0XK/CvsYJ8m5XNsbZIVOZzXA61q+AppRQkEgIrfM3eARz/RbrJzMvzAvVEe?=
 =?us-ascii?Q?oeFP8wcpMSyG18SC9NY6t0zKsymOIbqSw1r3oKgE14ptsSyKQ42re7h5M3AD?=
 =?us-ascii?Q?U8hnzI2DYCKbzoWnU0o0gV1LHXE88bU/Yw8sanLKDKTRBsYl311PZ/jkJsju?=
 =?us-ascii?Q?FG03pSDKttDQ6dzVyI5SxL9BQIe6N8GJ7FY7PIAnMNya1eV4pL+o2GxRo7GY?=
 =?us-ascii?Q?b4p4+a2KJ+xntZ+1ck5w5O5tW3LqxrS4vGbMi6005/n2JgE2VEDD+ep/erNS?=
 =?us-ascii?Q?+wLMLYeLtZJIbf+7JeS1e6MtZyphvfXtQ64f7d2+UQ5GU+QgRBV4x8CWMEDR?=
 =?us-ascii?Q?r9EPxb5Ng+JW3EYEr5V9f0PUnscVtb4tj1yVG6sj9vQilZFE2QYXY8dBEFys?=
 =?us-ascii?Q?BwPDWyCMrgbKKhqrseU0N1CVXSo//hOx1l0gFwDOTmbftBXPdrT3FDBDo6kB?=
 =?us-ascii?Q?7XR3I1c3FsQ5ImbwLH0wb1NsRptoPEKItnOGpgB2Kz7tgJOAcg0cgPpHjCfI?=
 =?us-ascii?Q?xqCx+eKGwqPgV4Ubu3q+9ZueyO0pDCNEDekICquVBbG5Kl7h0reYOaLb7IaT?=
 =?us-ascii?Q?hVnMYPd9kgS8vHy4VPpha1bQCs8zsngnWPitIJkY8tvLptMMyUKFI+6mFPye?=
 =?us-ascii?Q?19RXLiId0DOmq2eXnlL9DJHdRRGFH1O4rf30vadvxSYmHu6DI/+MzRFSzfIq?=
 =?us-ascii?Q?RXV14GWPWQglXPDNpFK6RuRkjGjQ9N1uzx5tfSIlCcXAM0rQEOSg42aZE3Xj?=
 =?us-ascii?Q?QaOrH3Al6TS0j2f0GnwQBtzbWguQy4klCL2mkjrFwKuNws3cfC1AtdxU/yGe?=
 =?us-ascii?Q?WWe54upE9mtyAqTKj/5ZOeoZfWpP2qVbtTGewkFBhqyu7KbCVd+dvyo7Yz7+?=
 =?us-ascii?Q?EUqiyFBs0q50++esu5RI6VdVYCiFg2aAe0EQ2WlzOvHXd528W6iRfUbJN1Qi?=
 =?us-ascii?Q?LxHGXqcBIY4yDPDcLRxRU1DWSjlMNGcHzz4jzCi0JjWE3bbSu5ptneMdmKIu?=
 =?us-ascii?Q?8igdgVZM5j9IngvyCzsqYQtMp+mILXqSblLbDdtcGIykpZsgW7HnRTpk7aWU?=
 =?us-ascii?Q?SVCo762PtJGdo5cA5enSnf8VQxOiwH5fIUpX8gsD8PuNk+IUVHJD8uQ9M1lh?=
 =?us-ascii?Q?9WpwJFTf2Vxgy3woC+6TQp18BAx38huIWvOYDQobXw0dzQXgJPBStZ27iPm8?=
 =?us-ascii?Q?ytxOqiqry13U4bO8mmIvdCinaRWW1A13Oask8vPefW2ucC6wjj8DJGOI7yvn?=
 =?us-ascii?Q?gvaChQ66Qq1UWZm9bsXXVZ4EnuhRdeBxFLewE0meMOkJU62gV2+buCGx70d+?=
 =?us-ascii?Q?tCW/6dh77FsgC/ZCbvISTD/kPaLanjS3YDH2PwqgyhF68Impol8o9kOpZ/fj?=
 =?us-ascii?Q?SiuvKx089AahBUCjqARdC+zVhel97hrHknzzgBGdYFy4boVdiP4MFRIbAUhN?=
 =?us-ascii?Q?Vh9SHVlUHwYXnwk0u2ZWL37vy/39VcZOaa3oRnpVJMSJ/0XwpVClWFLsA9ZZ?=
 =?us-ascii?Q?D4zKM6idiPe4VLk6v9HfZVKcHyeqx04o1R8rEuL2m+DISPoCojf8zAXPvrL6?=
 =?us-ascii?Q?WBBSUVKe4o01vL1dxsyFihMNPdD5BxR2ThDEP1C72N2xs35dsyzs?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cee5a055-0da7-43fb-5a9a-08df3bf743d1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 11:15:29.1817
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I7Dds49XZ+dDUPpuDlgKzHds1VIq0h1ZfGcs4iAIDx2SJCD9d/KWzvkGMjwQA4pQTwxIr9Fg0IyzF4VHB5HdLLluvApri3ePGSG2xBdbJIeYakLnPKTkI7bpkx5chKc4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB12035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_031534_210558_C79A651E 
X-CRM114-Status: GOOD (  19.10  )
X-Spam-Score: -1.0 (-)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Xu Yang <xu.yang_2@nxp.com>

When the host controller loses power during system suspend, the port
state is not retained. After power is restored, the port starts in the
Disconnected (RxDetect) state instead of its previous Enabled (U3)
state.

After the controller is switched back to host mode, testing on an i.MX8/9
SoC shows that it takes about 2 ms for the port to leave RxDetect and
enter Polling. If xHCI is reset while the port is still in RxDetect, the
port does not issue a Warm Reset.

This prevents the link from recovering because the USB3 device may
still be in U3. Once the port enters Polling, it sends LFPS.Polling, but
the device does not respond as expected. After three Polling attempts,
each taking about 360 ms (tPollingLFPSTimeout), the controller reports
the device as disconnected.

If xHCI is reset after the port has entered Polling, the port issues a
Warm Reset and the link recovers quickly after the device responds.

Add a 2 ms delay through the xHCI resume quirk before resetting xHCI.
This allows the port to leave RxDetect so that a Warm Reset can be
issued, avoiding an unnecessary device disconnect during system
resume.

Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
---
 drivers/usb/dwc3/host.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/usb/dwc3/host.c b/drivers/usb/dwc3/host.c
index c5674161b2b0..465c170df12c 100644
--- a/drivers/usb/dwc3/host.c
+++ b/drivers/usb/dwc3/host.c
@@ -78,8 +78,29 @@ static void dwc3_xhci_plat_start(struct usb_hcd *hcd)
 	dwc3_enable_susphy(dwc, true);
 }
 
+static int dwc3_xhci_resume_quirk(struct usb_hcd *hcd)
+{
+	struct platform_device *pdev;
+	struct dwc3 *dwc;
+
+	pdev = to_platform_device(hcd->self.controller);
+	dwc = dev_get_drvdata(pdev->dev.parent);
+
+	if (dwc->needs_full_reinit) {
+		/*
+		 * The port needs some time to leave RxDetect after host mode
+		 * is restored. Delay the xHCI reset until the port can enter
+		 * Polling, allowing a Warm Reset to recover the USB3 link.
+		 */
+		usleep_range(2000, 2500);
+	}
+
+	return 0;
+}
+
 static const struct xhci_plat_priv dwc3_xhci_plat_quirk = {
 	.plat_start = dwc3_xhci_plat_start,
+	.resume_quirk = dwc3_xhci_resume_quirk,
 };
 
 static void dwc3_host_fill_xhci_irq_res(struct dwc3 *dwc,
-- 
2.34.1


