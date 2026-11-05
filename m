Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E6C606D815
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 06:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cEWqouJa;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=eYRdz8Xu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=79/FQoBisPNHGF6H4KoDO6xZKm9bFxBlymm3eZQkSG0=; b=cEWqouJaYtQ1YG
	TQirdAhhjkeg82T0nU1zBH6GoTgNWFVKvDYw+E5DMn9R1Sv5V4IRqsv5fuc+UFhk8025KgDX5VNsi
	g1yFQqkTEsJzEvDV6OWtac+OHMCiiAbaClPMIW1BI0kZULGe/cBHwJVPOAGkGCBSY+i+53WlYRYOk
	i1MCa2XwNRmuZ/ofv4C0DyfeMEGkQvhble+n9UvSj7dqcWQQ7PTP06vz4WES1Jt2iUkPj5jEfuA+z
	wH4q4DnKnXUJt42QzSZPjG3+NBszNIXLbyrmmDtKtbc/tqzUFJBO+4HyCneeiB+olI0r+5MbUs+8a
	h3ZK4lYb3GGswD+qjT2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOrAf-00000007xye-0s3M;
	Thu, 05 Nov 2026 06:42:01 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOrAY-00000007xuk-0Hj6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 06:41:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KAamqQHuI3XTBXwzOy3Ih2R6CaWg95kA81LD1kzIX9o9uH52Qh6dC38M2lEyKC/BjvSDVaWw5O7u0TTTpKy74GoZd1YJtDgYZINWuzxMXs/vpIQdbasszrq6aR+Cf64g+90d5+LK93zn4RQk+lMPw3xDexyY+25Qzsum//j15WA04n9281nbSzjxz1y3cXHl+ZZEcLLSI6xhuQ3claQCEylgCKX69jHvpNduyCZWdRspUo87v0Gz0mq+Ldu7XTGqmlxV3tgrK/Q5wMx9LkbTDkLLBjRcYTBmLwnguzKfgi0uVZ4jZ42oMjr9Zp8DYEZfVbqiM0fWCAilOKIUmLbN5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=79/FQoBisPNHGF6H4KoDO6xZKm9bFxBlymm3eZQkSG0=;
 b=thicNV5qVbWuAT5zg+pCj4bPbB2pa7vwrneJ3CenwX+OeoropotH33GcHtu6wUiaKrmhCC7hjvrmJdDHwh4EO1QyUypKdy/G+3lpUveLxW7KYPqDChyqGdQiTkr9nqkdlLaL89pA2eUgUg5BiqjSRisjBU43A9UkGi2cMpemHVPAG/drG+aqvdE5kzqnvj97zbY6ktGqpWwQ95OKZkLMhtrm2u9urVLoYN1IEEzpixFJXqjfVZ86OdUHt6YRB0RyUhZUFdtfPIciazUBv3ywCjXXD8u1gx4Ldhn9kRf0lPWBHuU3xmII7Y53VwGBKsVujwBiONlzVQWt5m5gvQJurA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=79/FQoBisPNHGF6H4KoDO6xZKm9bFxBlymm3eZQkSG0=;
 b=eYRdz8Xu5q6DXIeSij9myJdo0a9SmcIlfo5p4Kgo1vH+sTV99PUtXXTDtUXuNfvrcw6XJNpzKFkZ7agqCJtvWrKcuFshsn1sNd4xijEIvPn/WBlYS5I6E3yqivAXAshyZSV0jtWGYGpaSipTAZRc9zuw7EKhEEUMXGHSXU9/CEsBfSqKNYZyfmr6Xu55l+FXdpfKaOspgBiLvyjRfWLCdsENNcBb++0MQTZLAPNxy6IJFuHym9MYHFc5WNSQP2zFdFawsLaQADp4LsZbp8GDJZpe2gBmGA0B36mDARJYrWQZOSPW00CKIgGJ/dPJ+DqN9/7LP6VwvE+E3Zj7R2960g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20) by DBBPR04MB8026.eurprd04.prod.outlook.com
 (2603:10a6:10:1ed::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 06:41:50 +0000
Received: from GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994]) by GVXPR04MB10021.eurprd04.prod.outlook.com
 ([fe80::d247:853:3e16:1994%5]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 06:41:50 +0000
From: Chancel Liu <chancel.liu@oss.nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 3/4] arm64: dts: freescale: imx952-evk: Add IMX-AUD-IO board support
Date: Thu,  5 Nov 2026 15:41:16 +0900
Message-ID: <20261105064117.277495-4-chancel.liu@oss.nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261105064117.277495-1-chancel.liu@oss.nxp.com>
References: <20261105064117.277495-1-chancel.liu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0087.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bf::14) To GVXPR04MB10021.eurprd04.prod.outlook.com
 (2603:10a6:150:112::20)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB10021:EE_|DBBPR04MB8026:EE_
X-MS-Office365-Filtering-Correlation-Id: 330cfaaa-46a1-4df5-35fa-08df3b07df05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|366016|376014|7416014|23010399003|22082099003|18002099003|6133799003|10067099003|3023799007|56012099006|11063799006|261026140227099003|261028144727099003|261022075727099003|261021121427099003|261021123027099003|261102123227099003|261022105027099003|261009223027099003|260925021311599003|260925021911599003|260925022911599003;
X-Microsoft-Antispam-Message-Info: dpGwl/iFhS7sH7xEiebwXl3US3H8CUYMa+roX/lHV7EzssGRR7Xtc0xHD+2oeLRbeiyPPm/sJ9sheI8aKLnMJ2GG0qlMGWBMUJJVSgy91tMD6w0/ajm/R8DGO0VJsfMhuj3Wkhv+EhdBf7FmsdOsiKX0NsJDGc8ekRXUPiBDKH6rNPZVOLnHhZhff5bxpsgaxUmijmifGo1aY6AXqsK5nA+GdAOMqoPkImGXguYgAWM+JAxIBByUj5RqiYVG++jWu7BGvcBBfs5Hw5JUzoyGuyR/D6vp0SRasCwkOJ5q8XwbrBcebYT378E/TIr3Han9vfkq3pr7aQqAboQqmwFdI8teMBPNtpl58P180wOcWRDk6ZffDuuVqbhHyzV5CuakZ00NifXYpOi1X3c6A5cG+eM2Q7VemMYafp+893aoruHYgs4keMPHLCHGJ3assFO5sWSL7uCOCh1sTZKCshBhVaSTUK+ow8SBQtY6jlsP9vaS1VwxuXQX3Qoj/gCIVepMKtvhqJ62n5OgQK4P1dpJCSmmQCQMTW+yTYpS3LRdNXIiYMqceLNMuBKsga/z1204J6xS8+2e1DcQgoVsPF2WMttkCnlhlpxeIo062U1Q3H67qUUA5KVm9g93kZlGEfg4iYegaVXtLjlw/PAFCOthzfucu6UxS2I/Kvhu71BZjF0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB10021.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(376014)(7416014)(23010399003)(22082099003)(18002099003)(6133799003)(10067099003)(3023799007)(56012099006)(11063799006)(261026140227099003)(261028144727099003)(261022075727099003)(261021121427099003)(261021123027099003)(261102123227099003)(261022105027099003)(261009223027099003)(260925021311599003)(260925021911599003)(260925022911599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?isXxErvXCdBPlx45+sXdhB/vynUbg5McBr1if7DC+L5OBS3LEq+/k7xeT+Uh?=
 =?us-ascii?Q?xZo+ZbDwTEQPb8h9Y8T84X7KvMgs867owW08+sxYKeeLOhEP28YqoQsNqvlS?=
 =?us-ascii?Q?axEyfiGnbGlA7vVxGxJB1yNBIVyoL/XQ+xYTbiJijWvhk6SY3X6UTIkA1+4l?=
 =?us-ascii?Q?jEqNfPXcmeujxN+UO3GcbiK9yW5yBufSXEIQgfFWE1Ut/rqAygOPwpUyQCpX?=
 =?us-ascii?Q?N5Ng1LrvcnAu8ZC8V3yxMtDK99Kc8ETugqq5HkEUvhusk2hEZlxI/JRIXXWr?=
 =?us-ascii?Q?YNfRgDW6m5sOUTJBEK+WoFulP4i1Y4Vq89mcmBpy2agIIKUe87j4YBWq6pnU?=
 =?us-ascii?Q?/q7tmoatjrEMh1pwbRvYrDCoMn83jRtfa54w11cHMDkf64yrthZyvd/zbVxW?=
 =?us-ascii?Q?qehoN1V+ID2GV9HoEKfMiNiMEl8VByIotgx6bgjJtIO1Ki7gRUZTBMy+OUtj?=
 =?us-ascii?Q?5K/2ur1Q5GlGAqWdiA12tYa0dYj11CqwkBMij8atBEoSwsMWWWDPllsIDCby?=
 =?us-ascii?Q?+LjAZUtJLAdClQ267EUvOreZSdqKpYxkMQ3LI9LZZO0cE5y6VIa+twLQDMC7?=
 =?us-ascii?Q?7240aLovQKwR0N1UCTrn6ohU9ZQ0uAt8pUFAgcaa3oDsJnTYZqTTVahEtQKM?=
 =?us-ascii?Q?K2CwaoMLnbkOGqV5LsyjA4MtIHcZW6jw272S1oFRBAEmmWfFwT8IHIwFXaSZ?=
 =?us-ascii?Q?VTb/Ev39lNkPu9jBEAmBHA6/JXWDChBVfbmP45nBeQDJPGX4iLEmZBr9+jFX?=
 =?us-ascii?Q?26cYv7yPIx/7CJ93nVmbVmdRlemfa3i9SKMOcee/PctVPJS+M4F/f0Bb9AZK?=
 =?us-ascii?Q?JB++RoTSbGuxDG8CucVaPjqrV0dkRyAE0XRssJsMWCMc8By+gHQgwyjgsnd5?=
 =?us-ascii?Q?JP6h5e2R15dyJlkkji9DNxWEM0/YyZlMaEtuAvDB8ZtQNbC3qdMMosS33wZr?=
 =?us-ascii?Q?E/U4I/rYKn1DAmkc9l1bZIbam74e9TyI5h2scQxN49IdzV00D6C+11kthqxk?=
 =?us-ascii?Q?94cJmlZ9FMhY8OLakcfVGzwh/6XI2+5DftihBBza12iZC/+BsU8DoUBwjbpw?=
 =?us-ascii?Q?pH9KKPUvldIXn8BqqkygT/cbqwj5xQJvabtEHFFJLdAcwu/lD8eUvPDTUEQi?=
 =?us-ascii?Q?bQRosZSyHijSlgHWibO3J408GzBCmvIkPabBnciqMkMFWQDfzgIYLI3leH00?=
 =?us-ascii?Q?j+SV1M/FU67AHFinKyn2uFAxK5c4+/AxoGvWFYAPJW9RNqENwYJGdaEw58yg?=
 =?us-ascii?Q?Yeh41zWfOFf3gqcApZepEGCakYeMRqToQnHAUoiKuNh93dkqHLM1aQJ0VQsR?=
 =?us-ascii?Q?C+UFbeapz8w6NHAtY9m9aQUieYn9c4F/NGBuDM5ctAcpdD9MwtsDG/9z2KVT?=
 =?us-ascii?Q?J07gd65mgIQN3FA+3CxIRwPthPlbug7mYTHLHsitlxYcIL1ya45AHQNhtL5i?=
 =?us-ascii?Q?tJaypKjX/SIVz01RB/33RWTCHuTSldGvj0qdrclEDliQAT7Vru6zdcCLD0hZ?=
 =?us-ascii?Q?oD3eXjGySvG67bOyHgSNtHmCxQLLyBLA015KqWIkDExTU8+nod0T/iWiOjtB?=
 =?us-ascii?Q?JnzeiiOp3oQsx9tKjd9RxkVSIGphN2FhTp4Z/FLH9XGdLgfMN+RVmkH4FlqE?=
 =?us-ascii?Q?JLwX3cGKcTCMhSxG0uuUsT+qVW/ZQFUKGIK+UaVitXjSwoWOneyMxJwgnMnr?=
 =?us-ascii?Q?drjrLiVx9S2V2YWSe9uSCnRBzmAtxhnCprQ3GeoQY3LkuSL48Pm/IZj6kwNG?=
 =?us-ascii?Q?gcfj1VWFlDAto85YA+cCbszFKaiEJeOXrI/WGbFepCOZorJNk0Ue?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 330cfaaa-46a1-4df5-35fa-08df3b07df05
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB10021.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 06:41:50.3724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ab/zbk5zel5tyXbu7TxnU2mDzLGeYwKPlyK/lXUyCht2l2deRNmxOUJ3N65r31HESGg/7kQQ7QM5MNeEFeHfnr9/RgODwnHVhbLhCARbineFP/bibpibn2+SjZFMnfF+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB8026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_224154_354513_129E7BC8 
X-CRM114-Status: GOOD (  11.79  )
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

From: Chancel Liu <chancel.liu@nxp.com>

IMX-AUD-IO is an add-on board which can be connected to i.MX952 EVK
through a physical connector. This connector is described as a
fsl,aud-io-slot connector to expose a constrained subset of GPIO and
clock resources to the add-on board using fixed electrical wiring.

Also add required regulator, sound CPU DAI and I2C bus configuration to
support IMX-AUD-IO on this base board.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx952-evk.dts | 67 +++++++++++++++++++-
 1 file changed, 65 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx952-evk.dts b/arch/arm64/boot/dts/freescale/imx952-evk.dts
index 047dfde20718..dbe0895b8965 100644
--- a/arch/arm64/boot/dts/freescale/imx952-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx952-evk.dts
@@ -49,6 +49,16 @@ amp_mqs1: audio-amplifier {
 		VCC-supply = <&reg_3p3v>;
 	};
 
+	aud_io_slot: connector {
+		compatible = "fsl,imx952-evk-aud-io", "fsl,imx95-19x19-evk-aud-io";
+		#gpio-cells = <2>;
+		gpio-map = <0 0 &pcal6416 8 GPIO_ACTIVE_LOW>;
+		gpio-map-mask = <0xffffffff 0x0>;
+		gpio-map-pass-thru = <0x0 0xffffffff>;
+		#clock-cells = <1>;
+		clock-map = <0 &scmi_clk IMX952_CLK_SAI2>;
+	};
+
 	bt_sco_codec: audio-codec-bt-sco {
 		#sound-dai-cells = <1>;
 		compatible = "linux,bt-sco";
@@ -190,13 +200,29 @@ reg_1p8v: regulator-1p8v {
 		regulator-name = "+V1.8_SW";
 	};
 
-	reg_vref_1v8: regulator-adc-vref {
+	aud_io_reg_1v8: reg_vref_1v8: regulator-adc-vref {
 		compatible = "regulator-fixed";
 		regulator-name = "vref_1v8";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 	};
 
+	aud_io_reg_3v3: regulator-aud-io-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "aud-io-3v3";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		gpio = <&pcal6416 11 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	aud_io_reg_5v: regulator-aud-io-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "aud-io-5v";
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+	};
+
 	reg_audio_pwr: regulator-audio-pwr {
 		compatible = "regulator-fixed";
 		regulator-name = "audio-pwr";
@@ -409,7 +435,7 @@ i2c4_pcal6408: gpio@21 {
 	};
 };
 
-&lpi2c6 {
+aud_io_i2c: &lpi2c6 {
 	clock-frequency = <100000>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_lpi2c6>;
@@ -556,6 +582,27 @@ &sai1 {
 	status = "okay";
 };
 
+aud_io_cpu: &sai2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sai2>;
+	clocks = <&scmi_clk IMX952_CLK_BUSNETCMIX>, <&clk_dummy>,
+		 <&scmi_clk IMX952_CLK_SAI2>, <&clk_dummy>,
+		 <&clk_dummy>, <&scmi_clk IMX952_CLK_AUDIOPLL1>,
+		 <&scmi_clk IMX952_CLK_AUDIOPLL2>;
+	clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3", "pll8k", "pll11k";
+	assigned-clocks = <&scmi_clk IMX952_CLK_AUDIOPLL1_VCO>,
+			  <&scmi_clk IMX952_CLK_AUDIOPLL2_VCO>,
+			  <&scmi_clk IMX952_CLK_AUDIOPLL1>,
+			  <&scmi_clk IMX952_CLK_AUDIOPLL2>,
+			  <&scmi_clk IMX952_CLK_SAI2>;
+	assigned-clock-parents = <0>, <0>, <0>, <0>,
+				 <&scmi_clk IMX952_CLK_AUDIOPLL1>;
+	assigned-clock-rates = <3932160000>, <3612672000>,
+			       <393216000>, <361267200>, <12288000>;
+	fsl,sai-mclk-direction-output;
+	fsl,sai-asynchronous;
+};
+
 &sai3 {
 	assigned-clocks = <&scmi_clk IMX952_CLK_AUDIOPLL1_VCO>,
 			  <&scmi_clk IMX952_CLK_AUDIOPLL2_VCO>,
@@ -783,6 +830,22 @@ IMX952_PAD_SAI1_TXD0__AONMIX_TOP_GPIO1_IO_13		0x51e
 		>;
 	};
 
+	pinctrl_sai2: sai2grp {
+		fsl,pins = <
+			IMX952_PAD_ENET2_MDIO__NETCMIX_TOP_SAI2_RX_BCLK		0x31e
+			IMX952_PAD_ENET2_MDC__NETCMIX_TOP_SAI2_RX_SYNC		0x31e
+			IMX952_PAD_ENET2_TD3__NETCMIX_TOP_SAI2_RX_DATA_0	0x31e
+			IMX952_PAD_ENET2_TD2__NETCMIX_TOP_SAI2_RX_DATA_1	0x31e
+			IMX952_PAD_ENET2_TXC__NETCMIX_TOP_SAI2_TX_BCLK		0x31e
+			IMX952_PAD_ENET2_TX_CTL__NETCMIX_TOP_SAI2_TX_SYNC	0x31e
+			IMX952_PAD_ENET2_RX_CTL__NETCMIX_TOP_SAI2_TX_DATA_0	0x31e
+			IMX952_PAD_ENET2_RXC__NETCMIX_TOP_SAI2_TX_DATA_1	0x31e
+			IMX952_PAD_ENET2_RD0__NETCMIX_TOP_SAI2_TX_DATA_2	0x31e
+			IMX952_PAD_ENET2_RD1__NETCMIX_TOP_SAI2_TX_DATA_3	0x31e
+			IMX952_PAD_ENET2_RD2__NETCMIX_TOP_SAI2_MCLK		0x31e
+		>;
+	};
+
 	pinctrl_sai3: sai3grp {
 		fsl,pins = <
 			IMX952_PAD_GPIO_IO17__WAKEUPMIX_TOP_SAI3_MCLK			0x31e
-- 
2.50.1


