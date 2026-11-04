Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B984606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 04:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=x5vWmzo2;
	dkim=pass (2048-bit key, unprotected) header.d=altera.com header.i=@altera.com header.a=rsa-sha256 header.s=selector2 header.b=DONyP7OL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=3yzk+xsycwqWQUXk2+wwOq7x6A13BOmxl2pm1Nq6qA0=; b=x5vWmzo2EcLBwXKFyWHUaDR1Xb
	nRiEfXpFkaFWeAbQLqsY25wGC2qKjdm0VVtO6AEc9bmlkClq1jUCD40R5Pgr7XsKfBakUJFhpGQ8U
	gWbWNmopOAn3SV/59FwJPrMzUdl/hQbE2/0Xy2vt6cz3NtT9PCGWTdlJocxKLtfB+WBrdCwYQ0AR2
	uHtDgti1lWohDa3xU+AOJLcuU5duyZmkQxtDsuyIHrtOpMxsOdlbBXwJaLgY4SaY5WQrMJkQuBe67
	PEEV62nepHIRau9CHnLqIgOpSBlxI/QCpYRyM8mUdyOPpUZWdtBa5cCza1wQFMPxIcD4BiYM12CPZ
	KBp9D16Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOSGK-00000004INA-0T2T;
	Wed, 04 Nov 2026 04:06:12 +0000
Received: from mail-centralusazon11011024.outbound.protection.outlook.com ([52.101.62.24] helo=DM5PR21CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOSGH-00000004IMq-2nF8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 04:06:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VHXKF0GrMdOUDZAEXdqL1HjeJBicwDi2EwhH94PTU9IBQjnrWOjZZlNqrI2cYpEnrkiPDhWUzGRHZ3AA2jY4GRmWvQfAI2edb198l1I9FnV2v+bQIOFlH+6t+RiIjjF51KSm97GiClgw0VUbfrXfgWF1atTa9Wj/FRctbfMURrrQwSBuhyQp+bD2GGx5F3c8zBuYQ9QThmntp/gU34xMXKBOIU3WpqT8yddsqAvPfFnyh1cEXZYStun+uPKQ+azZ5c8UhotPEGHcHmMEzmkIg/X0Aus5pc03Cnq8nrm41i7zZsXyxM7eZ0ksfEZNJfTN4XdL0OdWtR8eKWuzZH2W6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3yzk+xsycwqWQUXk2+wwOq7x6A13BOmxl2pm1Nq6qA0=;
 b=CSaOBabEWX/D+UUUxehWFxPZSYvSwO6CAuNbeaGPqJZA0nwt0mda7/LdqQIzuR2R0/5pJcM4eVoDI64GNxo/Gq0TITvA/IFL7l6lizmpyA9ZWFr6TmZti3WzYyAXJtU3MHaemK5NwnNhYAaz4sCz4j0noNaS3urqbjxDYSz5Imi8lDAtDxMp1kIZqOn2CnqSdSgrh0j7mtEB5ou5duovhPdnwx22It/I/wK1SvFrsGfoC980N893sbdRR7VYQHGr9wDMB2jhvWexVNCLNEyIHtARqKOhNogxA+ZUpuj3IUW4bN61/H1uGG3JutfdbXJdGRwQMELpD6axfyUSi6mjLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3yzk+xsycwqWQUXk2+wwOq7x6A13BOmxl2pm1Nq6qA0=;
 b=DONyP7OL61GleUejZHgN5HviALadiMLOtPoW5cJ6ebX/T9DTdv5TQUZQbUWiDNmASxSUyPrHQdqeA2P1kMQPRRkMTrQ/uojAMOyv7j2gzEPy+g6WCxrm1Xq0cYigqKhjr9A8LWio755hdrD9pQGUjRN2oADKMUiBacxnj9CEBRymoKfXrffTUF8HHb7jtzwh5o3rrP6H7lx40vXKcDnh34dUUakZsNUBBL+7pF+DFaxRtpOaeN0kfmJaFuYI2h3QPjjHTnwFc7PDro81YwIFDCssxuYNWAE0ooKCo4KPoxWkVp3Ura4Bt0L5DdaocjkDUWmvw1UCX2FtLeZzPyNFXQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com (2603:10b6:a03:432::18)
 by MN2PR03MB4958.namprd03.prod.outlook.com (2603:10b6:208:1ad::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Wed, 4 Nov
 2026 04:04:02 +0000
Received: from SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775]) by SJ0PR03MB6964.namprd03.prod.outlook.com
 ([fe80::b965:bfa8:58fb:e775%4]) with mapi id 15.21.0569.010; Wed, 4 Nov 2026
 04:04:01 +0000
From: muhammad.nazim.amirul.nazle.asmade@altera.com
To: netdev@vger.kernel.org
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 0/2] net: stmmac: dwmac-socfpga: Add Agilex5 TSN GMAC support
Date: Tue,  3 Nov 2026 20:03:18 -0800
Message-ID: <20261104040320.18077-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
X-Mailer: git-send-email 2.43.7
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0012.namprd07.prod.outlook.com
 (2603:10b6:a03:505::13) To SJ0PR03MB6964.namprd03.prod.outlook.com
 (2603:10b6:a03:432::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6964:EE_|MN2PR03MB4958:EE_
X-MS-Office365-Filtering-Correlation-Id: e6a5a788-718e-46af-42f7-08df3a28a85b
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024|23010399003|55112099003|56012099006|3023799007|261102123227099003|18002099003|10067099003|261009223027099003|261022113327099003|261021123027099003|261021121427099003|261022105027099003|261022075727099003|11063799006|261026121527099003|261028144727099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: GKuqo/KIQWVZiUFBXJzTVOAw4uYYgk8ez1x6nXTKGGGmd5pr6al+CZjI2AJ4o6X3tQ1D6kbimexcChSJTIP28zdCYX8uCVhzgCLRt4KEUJnXdYm/bZ6IMyPjUvkeUeBqwA3Ukv/uu5MKLeWCxiTbkNCskWyhnqRUVAWxmHnHrvWxM5r79LznpNp40OOfOEnfmHH+YA/MyIq/4A8hFltGH06uBJIO1LbHrCsE6RyzIbGm2EU3ITuviOlc2CZEHZpvLzSDxElxoVfUtHtSIlhZefFM2IfMn105YTW6PVhnSJc7gqD1xF6X9rZki21NXOE6lgvzwikRTFEu4cfHy2OhHJrj9XN9CwdHCQ2OKLoIykLl4s/ELwoNroZhU12UvFF8xRZE7vW5aYqz+5U5Czv8Z3uT8i10zkq/00hozqQpjT2kdZmjcEFr0Q/rdmrPdlO6skeUyJZ/53llr92Ld9riYc54iXwEStvUhtxgvdfMh/iqqij+m4MbwEpRXMdcrtjtp9Tp9SwvzeYtEBhhOBUjBmd476PIkLCm5ak2yZ2A4Z4MZqDtGUm2egpHxWcz8WW2a7Vr7FTAH2G5kNif4n7FMb142f72VaD/BX7/AdVGTyVPMgRmo8+omk9PWarcE+y8
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6964.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(376014)(1800799024)(23010399003)(55112099003)(56012099006)(3023799007)(261102123227099003)(18002099003)(10067099003)(261009223027099003)(261022113327099003)(261021123027099003)(261021121427099003)(261022105027099003)(261022075727099003)(11063799006)(261026121527099003)(261028144727099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VtGHjKo/NPrOmbLg//dc2hOlgi2fVDSd1whQ2w3QZ3IoRIBjlYSZYxFcey+w?=
 =?us-ascii?Q?aW9gQfCeh4jn/Q7dCPQNhs4Nykx7pcIQJhzq3ddEMykNztG0HiAbZ8fFAp1j?=
 =?us-ascii?Q?hOP6jQn1WYxCNCOAuaVbW1f7fdc8tD6hDJ6poxGMvZuNzDPi5cnChw89dVuo?=
 =?us-ascii?Q?bSzzVfQ+zpImdI6owPVjauKezFkR5uMsNzgwfS8NHSmkVDQ9jPtL/RuI8QDw?=
 =?us-ascii?Q?i5ia1Mnsw7F8vpIRu9A1Hz3PAV9tVocgZjMKZZdRf5HhlQebhj5Q+vFxv/nu?=
 =?us-ascii?Q?vw8XXNqoC+poqy5Xck2wAnCJiEKAbTj3eeVC/h3yd0+DxSxO+ZMXEDRO4rdi?=
 =?us-ascii?Q?m+WRjg3rZeLlYiIHqP+waoC+ZTBkgEejGNWh1Y5jCH8Ym/sRa27o3gSRRIzd?=
 =?us-ascii?Q?DkPL+IUaJKLAJsvN0SpfUZOIl41EUyV4TXXLKzuiaj2qUNaOq2OMhAqHdFMn?=
 =?us-ascii?Q?9alYsSBpzA5JmAW4Y4iGVjAj+mEOdqlKuJhw5QYmYX/Su5vfh81VwP9V1AZT?=
 =?us-ascii?Q?6hz0UXGGBLi/ZHviXHpGuTAtU6V5RQqdo6L/Cqp8a3AUrtUA4R13swwLoN1F?=
 =?us-ascii?Q?jK4kTmW6SgPc4bkAZu6X4cpjKbFuzjReGJERs27RZINyRfUDM30OpW68purp?=
 =?us-ascii?Q?oSGTENQvXNaxnuA2/jbfNahBlYm4M/iVmtibvWy6TUDAOVBvZgFF01KWZmQT?=
 =?us-ascii?Q?67WAms2EQIYN5/r89yj+kGiTV1hiX9wS3j3It2QtbOc+7Q3cEnYWZzbgDCNH?=
 =?us-ascii?Q?5xwWlYoJ8Owdq8Z043GL6rDMuoGtalXJ7lWOCGyC1cbvhPEfHTQHtYJFIW0D?=
 =?us-ascii?Q?R/bmIXEA7qCPztlFXk8tzvkppOzvvigwV5CSgB7Xpj/4AkXsnUi3NINomeLn?=
 =?us-ascii?Q?7F1QJ7s4hL6Mn3sY7NB2D8ySWI2z0i/2dpaNA+zW0Rn83k/Z72oytX/euhoW?=
 =?us-ascii?Q?VS05ZVak82kjX4xTUoe19yIwqH6JWNQx+9OpuGp15rz1/Mw5JqxTvWvXxyY9?=
 =?us-ascii?Q?LaMhAyG9fTRtzyX22Qf1nnQC0FiuT51raGWYWHADDYMOoGIpE/Y4iAvKll8d?=
 =?us-ascii?Q?2v/6oMIZ4O5bfqvUf3fxhGbxMQ4t2zs8lKFhfwc91AlY5VA25OPEYYQm401J?=
 =?us-ascii?Q?+0KCmKNpbaAooAePFRY9hocdiH5AskPWV04K9ogcHjf8cKpd5DKfwWvqjdwW?=
 =?us-ascii?Q?2Gwq/eaKCEH3MzeuPsXX7c270oV/FRFDc3jgZFELUGvZbcbzOVpeV2hHXW1G?=
 =?us-ascii?Q?dzNbjJAk4pGoRRDQbwuHY2Vk/WWlTD6bPkZJVeoG8+wOvItZNF2n5yFJ+fFG?=
 =?us-ascii?Q?3Wxe72Zx0b0oZC6eXW5W5WLIj9ZzAiLPwWXJZw4+WgHLL2TI73RgmDudC4Ib?=
 =?us-ascii?Q?bi5N325VHo4uHbjDte1LvnTswka1VTO4yf1BKzlwRHMYuOGRfPBV0wOOTNvW?=
 =?us-ascii?Q?/gYzRetiZRUGNvATaD85unRCzw1a3lZozc8TyPdwOjOd9gTbKnkUj9YxPfrY?=
 =?us-ascii?Q?ieD92vs1nXiFAW7NWKNTXIagea/LPm6Qfth4hva3sOdYTBejQYh5sBuk4xEa?=
 =?us-ascii?Q?bpIJhOFP5R1BiqEmLTrd1/qesn0I8Ca2W8MkvjNmcjEOao9Q+vbWExxjfnFs?=
 =?us-ascii?Q?mj6T8qaXziCuqozVDT06Vy94IS8OXaZIqOozz/LCagz4MxKlcdF7tz98aTz7?=
 =?us-ascii?Q?CxfgnIeGn9PIiUQQ2RynBgCGzUZ3sHNNcaBy0HLEbwLTMbHXRSY7+kjCVT12?=
 =?us-ascii?Q?g7r+v2osIorJPzUyM1WirduMAJo+wrr8pCaS4ly5/9xvJBwDShb4MuWQlBLx?=
X-MS-Exchange-AntiSpam-MessageData-1: sLPqIlJSEEd/ww==
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6a5a788-718e-46af-42f7-08df3a28a85b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6964.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 04:04:01.5722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 27h7iHDVwnxMVNd47BkWMK//RgWi/I2cgopZPHjH+Ov2xf2xwwr4K1klLyEaUIKKFCfFcETi3Q5qi6zSRwvIL7+ZXn0MpPBDqBjeHSkDJNIcvWYr/T+mHjhvFSP9/KLnO4WDI164mnUETb1PKXdwWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB4958
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_200609_732487_F03F9E62 
X-CRM114-Status: GOOD (  13.96  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>

This series adds support for the gmac1 TSN port on the Intel SoCFPGA
Agilex5 SoCDK TSN Config2 board.

The TSN port (gmac1) connects to its PHY through a GMII-to-RGMII converter
implemented as FPGA soft IP. This converter provides the RGMII TX/RX clock
delays, requiring the MAC interface selector to be configured for GMII while
the PHY-facing interface is configured as RGMII without delay duplication.

Patch 1 documents the altr,socfpga-stmmac-agilex5-tsn compatible. Patch 2
adds dedicated match .data ops for the required interface setup.

The board-level binding and DTS patches will be sent separately to the
SoCFPGA tree.

This is a reposted version with a fix based on Jakub Kicinski's review:
https://lore.kernel.org/all/20260928184340.51da489c@kernel.org/

v2:
  - Extend the interrupt/interrupt-names/dma-coherent allOf conditional in
    the net binding to match altr,socfpga-stmmac-agilex5-tsn, per Jakub
    Kicinski / the netdev review bot. The TSN port uses the same
    DWXGMAC-2.10 core, so it must take the 17-interrupt, dma-coherent
    branch rather than the single-interrupt else branch.

These two patches were previously posted as patches 3 and 4 of the
"Add Agilex5 SoCDK TSN Config2 board support" series (up to v6), then
reposted as a standalone net-next series per Jakub Kicinski's request.
History from the board series:

v6:
  - Put altr,socfpga-stmmac-agilex5-tsn in the same compatible enum as
    altr,socfpga-stmmac-agilex5 in the net binding, per Krzysztof Kozlowski.

v5:
  - Replace of_device_is_compatible() probe check with dedicated
    socfpga_agilex5_tsn_gmac_ops via match .data, per Krzysztof Kozlowski
    and Dinh Nguyen.
  - Drop altr,socfpga-stmmac-agilex5 fallback from the TSN compatible list
    and rewrite the net binding commit message to explain the hardware
    difference, per Krzysztof Kozlowski.

v4:
  - Add Reviewed-by from Andrew Lunn on the driver patch.

v2 (board series):
  - Replace mac-mode DT property with compatible string-based detection per
    Andrew Lunn's feedback.
  - Use phy-mode = "rgmii-id" to correctly reflect MAC-side delay handling.
  - Rename compatible string to altr,socfpga-stmmac-agilex5-tsn for
    consistency with existing altr,socfpga-stmmac-* compatibles.
  - Add DT binding documentation for new net compatible string (new patch).

Nazim Amirul (2):
  dt-bindings: net: altr,socfpga-stmmac: Add
    altr,socfpga-stmmac-agilex5-tsn compatible
  net: stmmac: dwmac-socfpga: Add support for Agilex5 TSN GMAC with FPGA
    converter

 .../bindings/net/altr,socfpga-stmmac.yaml     |  9 ++++++--
 .../ethernet/stmicro/stmmac/dwmac-socfpga.c   | 23 ++++++++++++++++++-
 2 files changed, 29 insertions(+), 3 deletions(-)

-- 
2.43.7


